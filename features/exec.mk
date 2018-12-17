target = $($(stem).target)

define exec_impl
    $(eval $1.target ?= $(bld)/$1)
    execs += $(target)
    $(target): LDFLAGS = $($1.libs:%=-l%)
    $(target): $($1.src:%.cpp=$(bld_root)/%.o)
    -include $(wildcard $($1.src:%.cpp=$(bld_root)/%.d)) /dev/null
endef

define exec
    $(info Defining exec "$1".)
    $(eval $(exec_impl))
    all: $(target)
endef


