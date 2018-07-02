package utils

import (
	"code.rongyi.io/LER0ever/EverVim/env"
	log "github.com/sirupsen/logrus"
	"strings"
)

// Ubuntu/Debian and their derivatives
type apt struct{}

var Apt apt // simulate static method lol

func (*apt) IsAvailable() bool {
	return env.IsExeInPath("apt") && env.IsExeInPath("dpkg") // require both of them available
}

func (*apt) Install(packagename ...string) bool {
	log.Infof("Installing %v using apt, please enter your password when necessary.", packagename)
	err, _ := ExecCmd(1, "apt", append([]string{"install"}, packagename...)...)
	if err != nil {
		log.Warnf("apt installation failed ...")
		return false
	} else {
		return true
	}
}

func (*apt) IsInstalled(packagename string) bool {
	err, out := ExecCmd(2, "dpkg", append([]string{"-s"}, packagename)...)
	if err != nil {
		log.Warnf("dpkg -s pkgname failed ...")
		return false
	} else {
		if strings.Contains(out, "Installed") {
			return true
		}
	}
	return false
}

// Manjaro/Archlinux and their derivatives
type pacman struct {}
var Pacman pacman

func (*pacman) IsAvailable() bool {
	return env.IsExeInPath("pacman")
}

func (*pacman) Install(packagename ...string) bool {
	log.Infof("Installing %v using pacman, please enter your password when necessary.", packagename)
	err, _ := ExecCmd(1, "pacman", append([]string{"-S"}, packagename...)...)
	if err != nil {
		log.Warnf("pacman installation failed ...")
		return false
	} else {
		return true
	}
}

func (*pacman) IsInstalled(packagename string) bool {
	err, out := ExecCmd(2, "pacman", append([]string{"-Q"}, packagename)...)
	if err != nil {
		log.Warnf("pacman -Q pkgname failed ...")
		return false
	} else {
		if !strings.Contains(out, "not found") {
			return true
		}
	}
	return false
}

type apk struct {}
var Apk apk

func (*apk) IsAvailable() bool {
	return env.IsExeInPath("apk")
}

func (*apk) Install(packagename ...string) bool {
	log.Infof("Installing %v using apk, please enter your password when necessary.", packagename)
	err, _ := ExecCmd(1, "apk", append([]string{"add"}, packagename...)...)
	if err != nil {
		log.Warnf("apk installation failed ...")
		return false
	} else {
		return true
	}
}

func (*apk) IsInstalled(packagename string) bool {
	err, out := ExecCmd(2, "apk", append([]string{"info", "-e"}, packagename)...)
	if err != nil {
		log.Warnf("apk info -e pkgname failed ...")
		return false
	} else {
		if strings.Contains(out, packagename) {
			return true
		}
	}
	return false
}