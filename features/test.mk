define test_impl
    $(info Defining test "$1")
    all: $(1:%=$(bld)/%.ok)
    $(eval $1.src ?= $(wildcard $(src)/*Test.cpp))
    $(eval $1.libs += gtest_main gtest)
    $(exec_impl)
endef

test = $(eval $(test_impl))

