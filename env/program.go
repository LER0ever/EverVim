package env

import (
	"os/exec"
)

func ExePath(executable string) (bool, string) {
	exepath, err := exec.LookPath(executable)
	if err != nil {
		return false, ""
	}
	return true, exepath
}

func IsExeInPath(executable string) bool {
	inpath, _ := ExePath(executable)
	return inpath
}
