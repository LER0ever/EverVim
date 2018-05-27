package bootstrap

import (
	"github.com/LER0ever/EverVim/env"
	"github.com/LER0ever/EverVim/utils"
	log "github.com/sirupsen/logrus"
)

func ensureVimReq() bool {
	b_NeoVim := detectNeoVimWLog()
	b_Vim := detectVimWLog()
	if b_NeoVim{
		return true
	} else if b_Vim {
		if askForVimInstallation() {
			tryInstallNeoVim()
		}
		return true
	} else {
		if askForVimInstallation() && tryInstallNeoVim() {
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

func tryInstallNeoVim() bool {
	return true
}