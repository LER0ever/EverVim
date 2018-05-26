package bootstrap

import (
	"github.com/LER0ever/EverVim/env"
	log "github.com/sirupsen/logrus"
)

func checkVimReq() bool {
	b_NeoVim := detectNeoVimWLog()
	b_Vim := detectVimWLog()
	if (b_NeoVim || b_Vim) {
		return true
	} else {
		return false
	}
}

func detectVimWLog() bool {
	inpath, exepath := env.IsVimAvailable()
	vim_fields := log.Fields{
		"Available": inpath,
		"Vim Path":  exepath,
	}
	if (inpath) {
		log.WithFields(vim_fields).Infof("Vim is available\n")
		return true
	} else {
		log.WithFields(vim_fields).Warnf("Vim is not available\n")
		return false
	}
}

func detectNeoVimWLog() bool {
	inpath, exepath := env.IsNeoVimAvailable()
	neovim_fields := log.Fields{
		"Available": inpath,
		"NeoVim Path":  exepath,
	}
	if (inpath) {
		log.WithFields(neovim_fields).Infof("NeoVim is available\n")
		return true
	} else {
		log.WithFields(neovim_fields).Warnf("NeoVim is not available\n")
		return false
	}
}