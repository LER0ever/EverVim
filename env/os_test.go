package env

import (
	"runtime"
	"testing"

	. "github.com/smartystreets/goconvey/convey"
)

func TestGetOS(t *testing.T) {
	Convey("Given My OS Info", t, func() {
		res_getOS := GetOS()
		if runtime.GOOS == "linux" {
			So(res_getOS, ShouldEqual, Linux)
		}
		if runtime.GOOS == "windows" {
			So(res_getOS, ShouldEqual, Windows)
		}
		if runtime.GOOS == "darwin" {
			So(res_getOS, ShouldEqual, macOS)
		}
		So(res_getOS, ShouldNotEqual, UnknownOS)
	})
}

func TestGetKernelVersion(t *testing.T) {
	Convey("Given Linux Machine", t, func() {
		if runtime.GOOS == "linux" {
			res, _ := GetKernelVersion()
			t.Logf("Kernel Version: %s\n", res)
		}
	})
}
