package bootstrap

import (
	"code.rongyi.io/LER0ever/EverVim/env"
	"code.rongyi.io/LER0ever/EverVim/utils"
	log "github.com/sirupsen/logrus"
)

func ensureVimReq() bool {
	b_NeoVim := detectNeoVimWLog()
	b_Vim := detectVimWLog()
	if b_NeoVim {
		return true
	} else if b_Vim {
		if askForVimInstallation() {
			tryInstallVim()
		}
		return true
	} else {
		if askForVimInstallation() && tryInstallVim() {
			return true
		}
		return false
	}
}

func detectVimWLog() bool {
	inpath, exepath := env.IsVimAvailable()
	vim_fields := log.Fields{
		"Available": inpath,
		"Vim Path":  exepath,
	}
	if inpath {
		log.WithFields(vim_fields).Infof("Vim is available")
		return true
	} else {
		log.WithFields(vim_fields).Warnf("Vim is not available")
		return false
	}
}

func detectNeoVimWLog() bool {
	inpath, exepath := env.IsNeoVimAvailable()
	neovim_fields := log.Fields{
		"Available":   inpath,
		"NeoVim Path": exepath,
	}
	if inpath {
		log.WithFields(neovim_fields).Infof("NeoVim is available")
		return true
	} else {
		log.WithFields(neovim_fields).Warnf("NeoVim is not available")
		return false
	}
}

func askForVimInstallation() bool {
	ans := utils.YesNoQuestion("Do you want me to install NeoVim for you?")
	return ans
}

func tryInstallVim() bool {
	if utils.Apt.IsAvailable() {
		suc := utils.Apt.Install("neovim")
		if suc {
			return true
		}
	}

	if utils.Pacman.IsAvailable() {
		suc := utils.Pacman.Install("neovim")
		if suc {
			return true
		}
	}

	if utils.Apk.IsAvailable() {
		suc := utils.Apk.Install("neovim")
		if suc {
			return true
		}
	}

	log.Warnf("Cannot figure out how to install Neovim for you, falling back to install Vim")

	return false
}
