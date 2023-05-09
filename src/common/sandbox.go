package common

import (
	"fmt"
	"strings"
)

func SandboxPoolFromConfig(name string, sizeMb int) (cf SandboxPool, err error) {
	if Conf.Sandbox == "docker" {
		return NewDockerPool("", nil)
	} else if Conf.Sandbox == "sock" {
		mem := NewMemPool(name, sizeMb)
		pool, err := NewSOCKPool(name, mem)
		if err != nil {
			return nil, err
		}
		NewSOCKEvictor(pool)
		return pool, nil
	}

	return nil, fmt.Errorf("invalid sandbox type: '%s'", Conf.Sandbox)
}

func fillMetaDefaults(meta *SandboxMeta) *SandboxMeta {
	if meta == nil {
		meta = &SandboxMeta{}
	}
	if meta.MemLimitMB == 0 {
		meta.MemLimitMB = Conf.Limits.Mem_mb
	}
	if meta.CPUPercent == 0 {
		meta.CPUPercent = Conf.Limits.CPU_percent
	}
	return meta
}

func (meta *SandboxMeta) String() string {
	return fmt.Sprintf("<installs=[%s], imports=[%s], mem-limit-mb=%v>",
		strings.Join(meta.Installs, ","), strings.Join(meta.Imports, ","), meta.MemLimitMB)
}

func (e SandboxError) Error() string {
	return string(e)
}

func (e SandboxDeadError) Error() string {
	return string(e)
}
