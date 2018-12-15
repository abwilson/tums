define test_impl
    test: $(1:%=$(bld)/%.ok)
    $(eval $1.src ?= $(wildcard $(src)/*Test.cpp))
    $(eval $1.libs += gtest_main gtest)
    $(exec_impl)
    $(eval tests += $(target))
endef

# $(info $(test_impl))
define test
    $(info Defining test "$1".)
    $(eval $(test_impl))
endef

#    $(info src in test $(src))
