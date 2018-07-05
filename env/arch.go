package env

import "runtime"

type Arch int

const (
	_ Arch = iota
	X86_64
	X86
	AArch64
	Arm32
	PowerPC64
	Mips64
	UnknownArch
)

func GetArch() Arch {
	switch runtime.GOARCH {
	case "amd64":
		return X86_64
	case "386":
		return X86
	case "arm64":
		return AArch64
	case "arm":
		return Arm32
	case "ppc64le": // only little endian are actively supported by Go
		return PowerPC64
	case "mips64le":
		return Mips64
	default:
		return UnknownArch
	}
}
