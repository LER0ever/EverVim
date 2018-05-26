package env

import (
	"runtime"
	"testing"

	. "github.com/smartystreets/goconvey/convey"
)

func TestIsExecInPath(t *testing.T) {
	Convey("Check if **ls** is in Unix", t, func() {
		if runtime.GOOS != "windows" {
			inpath, exepath := IsExeInPath("ls")
			So(inpath, ShouldEqual, true)
			t.Logf("ls is at %s\n", exepath)
		}
	})

	Convey("Check if aoeuidhtns is not in path", t, func() {
		inpath, _ := IsExeInPath("aoeuidhtns")
		So(inpath, ShouldEqual, false)
	})
}
