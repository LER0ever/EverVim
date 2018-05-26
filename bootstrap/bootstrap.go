package bootstrap

import (
	log "github.com/sirupsen/logrus"
)

func init() {
	log.SetLevel(log.DebugLevel)
}

func GuidedInstall() {
	log.Infof("Starting Guided EverVim Installation ...\n")
	checkVimReq()
	askForAutoCompletion()
}

