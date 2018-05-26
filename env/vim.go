package env

import (
	"fmt"
	"os/exec"
)

func IsVimAvailable() (bool, string) {
	return IsExeInPath("vim")
}

func IsNeoVimAvailable() (bool, string) {
	return IsExeInPath("nvim")
}

func GetVimVersionString(useRPC bool) string {
	if !useRPC {
		out, err := exec.Command("vim", "--version").Output()
		if err != nil {
			fmt.Errorf("Error getting vim version string: %s\n", err.Error())
			return ""
		}
		return string(out)
	}
	// TODO: write an RPC version later
	return ""
}

func GetNeoVimVersionString(useRPC bool) string {
	if !useRPC {
		out, err := exec.Command("nvim", "--version").Output()
		if err != nil {
			fmt.Errorf("Error getting neovim version string: %s\n", err.Error())
			return ""
		}
		return string(out)
	}
	// TODO: write an RPC version later
	return ""
}
