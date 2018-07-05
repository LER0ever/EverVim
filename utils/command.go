package utils

import (
	"bytes"
	"os"
	"os/exec"

	log "github.com/sirupsen/logrus"
)

// ExecCmd wraps the command execution
func ExecCmd(option int, strcmd string, strargs ...string) (error, string) {
	switch option {
	case 0: // sudo plain command
		strargs = append([]string{strcmd}, strargs...)
		cmd := exec.Command("sudo", strargs...)
		var stdOut bytes.Buffer
		var stdErr bytes.Buffer

		cmd.Stdin = os.Stdin
		cmd.Stdout = &stdOut
		cmd.Stderr = &stdErr

		err := cmd.Run()
		if err != nil {
			log.Warnf("Command exited with error: %s", stdErr.String())
			return err, ""
		}
		return nil, stdOut.String()
	case 1: // sudo interactive command
		strargs = append([]string{strcmd}, strargs...)
		cmd := exec.Command("sudo", strargs...)
		var stdErr bytes.Buffer

		cmd.Stdin = os.Stdin
		cmd.Stdout = os.Stdout
		cmd.Stderr = &stdErr

		err := cmd.Run()
		if err != nil {
			log.Warnf("Command exited with error: %s", stdErr.String())
			return err, ""
		}
		return nil, ""
	case 2: // plain command
		cmd := exec.Command(strcmd, strargs...)
		var stdOut bytes.Buffer
		var stdErr bytes.Buffer

		cmd.Stdin = os.Stdin
		cmd.Stdout = &stdOut
		cmd.Stderr = &stdErr

		err := cmd.Run()
		if err != nil {
			log.Warnf("Command exited with error: %s", stdErr.String())
			return err, ""
		}
		return nil, stdOut.String()
	case 3: // interactive command
		cmd := exec.Command(strcmd, strargs...)
		var stdErr bytes.Buffer

		cmd.Stdin = os.Stdin
		cmd.Stdout = os.Stdout
		cmd.Stderr = &stdErr

		err := cmd.Run()
		if err != nil {
			log.Warnf("Command exited with error: %s", stdErr.String())
			return err, ""
		}
		return nil, ""
	default:
		return nil, "" // TODO: error handling
	}
}
