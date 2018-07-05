package env

import (
	"runtime"
	"testing"

	. "github.com/smartystreets/goconvey/convey"
)

func TestGetArch(t *testing.T) {
	Convey("Testing Arch Detection", t, func() {
		res_getArch := GetArch()
		if runtime.GOARCH == "amd64" {
			So(res_getArch, ShouldEqual, X86_64)
		}
		if runtime.GOARCH == "386" {
			So(res_getArch, ShouldEqual, X86)
		}
		if runtime.GOARCH == "arm64" {
			So(res_getArch, ShouldEqual, AArch64)
		}
		So(res_getArch, ShouldNotEqual, UnknownArch)
	})
}
