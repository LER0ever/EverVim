package env

import (
	"os/exec"
)

func IsExeInPath(executable string) (bool, string) {
	exepath, err := exec.LookPath(executable)
	if err != nil {
		return false, ""
	}
	return true, exepath
}
