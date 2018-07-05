package utils

import (
	ct "github.com/daviddengcn/go-colortext"
	"github.com/dixonwille/wmenu"
	log "github.com/sirupsen/logrus"
	wlog "gopkg.in/dixonwille/wlog.v2"
)

// YesNoQuestion prompts the question and ask for y/n
func YesNoQuestion(question string) bool {
	ans := -1
	menu := wmenu.NewMenu(question)
	menu.AddColor(wlog.Color{Code: ct.Green}, wlog.Color{Code: ct.Yellow}, wlog.Color{Code: ct.Cyan}, wlog.Color{Code: ct.Yellow})
	menu.Action(func(opts []wmenu.Opt) error {
		log.Debugf("Yes No Choice: %s : %s\n", opts[0].Text, opts[0].Value)
		if opts[0].Text == "n" {
			ans = 0
		} else if opts[0].Text == "y" {
			ans = 1
		}
		return nil
	})
	menu.IsYesNo(0)
	menu.Run()
	if ans == -1 {
		log.Fatalf("Unexpected answer.")
		return false
	} else {
		return ans == 1
	}
}

func MultipleChoice(
	question string,
	choices []string,
) int {
	ans := -1
	menu := wmenu.NewMenu(question)
	menu.AddColor(wlog.Color{Code: ct.Green}, wlog.Color{Code: ct.Yellow}, wlog.Color{Code: ct.Cyan}, wlog.Color{Code: ct.Yellow})
	menu.Action(func(opts []wmenu.Opt) error {
		if len(opts) != 1 {
			log.Fatalf("Unexpected number of answers")
		}
		if opts[0].Value.(int) >= 0 && opts[0].Value.(int) < len(choices) {
			ans = opts[0].Value.(int)
		}
		return nil
	})
	for i := 0; i < len(choices); i++ {
		menu.Option(choices[i], i, i == 0, nil)
	}
	menu.Run()
	if ans == -1 {
		log.WithFields(log.Fields{
			"Choice": ans,
		}).Fatalf("Invalid User Choice.")
	}
	return ans
}
