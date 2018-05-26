package env

import (
	"errors"
	"os/exec"
	"regexp"
	"runtime"
)

type OS int

const (
	_ OS = iota
	Linux
	macOS
	Windows
	FreeBSD
	Android
	Solaris
	Unknown
)

func GetOS() OS {
	switch runtime.GOOS {
	case "linux":
		return Linux
	case "windows":
		return Windows
	case "darwin":
		return macOS
	case "freebsd":
		return FreeBSD
	case "android":
		return Android
	case "solaris":
		return Solaris
	default:
		return Unknown
	}
}

func GetNTVersion() (string, error) {
	if runtime.GOOS != "windows" {
		return "", errors.New("cannot detect NT version on non-Windows machine")
	}

	out, err := exec.Command("cmd", "/c", "ver").Output()
	if err != nil {
		return "", errors.New("cannot find NT version")
	}

	r := regexp.MustCompile("[^0-9|.]+")
	ntv := r.ReplaceAllString(string(out), "")

	return ntv, nil
}

func GetKernelVersion() (string, error) {
	if runtime.GOOS == "windows" {
		return "", errors.New("cannot detect kernel version on Windows")
	}

	out, err := exec.Command("uname", "-r").Output()
	if err != nil {
		return "", errors.New("cannot find kernel version")
	}

	r := regexp.MustCompile("[\n]+")
	kv := r.ReplaceAllString(string(out), "")

	return kv, nil
}
