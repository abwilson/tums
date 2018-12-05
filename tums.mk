.PHONY: all
all:

.SECONDEXPANSION:

src_root := .
bld_root = bld

$(if $(subst $(realpath $(src_root)),,$(realpath $(bld_root))),$(info paths ok),$(error paths bad))

bin = $(bld_root)/bin

this_rules.mk = $(lastword $(MAKEFILE_LIST))
src = $(patsubst %/,%,$(dir $(this_rules.mk)))
bld = $(bld_root)/$(src)

include make/features/*.mk
include make/patterns/*.mk

-include rules.mk
