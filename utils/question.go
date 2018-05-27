package utils

import (
	"github.com/dixonwille/wmenu"
	log "github.com/sirupsen/logrus"
)

func YesNoQuestion(question string) bool {
	ans := -1
	menu := wmenu.NewMenu(question)
	menu.Action(func(opts []wmenu.Opt) error {
		log.Debugf("Yes No Choice: %s : %s\n", opts[0].Text, opts[0].Value)
		if opts[0].Text == "n" {
			ans = 0
		} else if opts[0].Text == "y" {
			ans = 1
		}
		return nil
	})
	menu.IsYesNo(1)
	menu.Run()
	if ans == -1 {
		log.Fatalf("Unexpected answer.")
		return false
	} else {
		return ans == 1
	}
}
