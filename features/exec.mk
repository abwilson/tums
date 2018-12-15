target = $($(stem).target)
# sources.cpp = $($1.sources.cpp)

define exec_impl
    $(eval $1.target ?= $(bld)/$1)
    execs += $(target)
    $(target): LDFLAGS = $($1.libs:%=-l%)
    $(target): $($1.src:$(src)/%.cpp=$(bld)/%.o)
    -include $(wildcard $($1.src:$(src)/%.cpp=$(bld)/%.d))
endef

define exec
    $(info Defining exec "$1".)
    $(eval $(exec_impl))
    all: $(target)
endef

#    $($1.src:$(src)/%.cpp=$(bld)/%.d):;
#    deps += $($1.src:$(src)/%.cpp=$(bld)/%.d)

#    $(info src in exec $(src))
