package bootstrap

import (
	"github.com/LER0ever/EverVim/env"
	log "github.com/sirupsen/logrus"
	"runtime"
)

func ensureOS() bool {
	targetOS := env.GetOS()
	if (targetOS == env.UnknownOS) {
  		log.WithFields(log.Fields{
  			"Target OS": targetOS,
			"Status": "Failure",
		}).Warn("Unsupported OS detected, continuing as Unix")
	} else {
		log.WithFields(log.Fields{
			"Target OS": targetOS,
			"Status": "Success",
		}).Infof("OS detected, installing for %s", runtime.GOOS)
	}
	return true // assume all OS are OK
}

func ensureArch() bool {
	targetArch := env.GetArch()
	if (targetArch == env.UnknownArch) {
		log.WithFields(log.Fields{
			"Target Arch": targetArch,
			"Status":  "Failure",
		}).Warn("Unsupported Architecture detected, continuing as native")
	} else {
		log.WithFields(log.Fields{
			"Target Arch": targetArch,
			"Status": "Success",
		}).Infof("Architecture detected, installing for %s", runtime.GOARCH)
	}
	return true // assume vim runs on all arch
}