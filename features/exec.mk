define exec_impl
    $(info Defining exec "$1")
    execs += $1
    all: $(bld)/$1
    $(bld)/$1: LDFLAGS = $($1.libs:%=-l%)
    $(bld)/$1: $($1.src:$(src)/%.cpp=$(bld)/%.o)
endef
exec = $(eval $(exec_impl))
