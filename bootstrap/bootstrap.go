package bootstrap

import (
	log "github.com/sirupsen/logrus"
)

func init() {
	log.SetLevel(log.DebugLevel)
}

func GuidedInstall() {
	log.Infof("Starting Guided EverVim Installation ...")
	assert(ensureOS(), "current system is supported")
	assert(ensureArch(), "current architecture is supported")
	assert(ensureVimReq(), "either neovim(preferred) or vim is available")
	askForAutoCompletion()
}

func assert(f bool, desc string) {
	if !f {
		log.Fatalf("Failed to make sure %s, exiting ...", desc)
	}
}