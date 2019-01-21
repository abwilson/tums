define test_impl
    $(info Defining test "$1".)    
    $(eval test: $(1:%=$(bld)/%.ok))
    $(eval $1.src ?= $(wildcard $(src)/*Test.cpp))
    $(eval $1.libs += gtest_main gtest gmock)
    $(exec_impl)
    $(eval tests += $(target))
    $(info src in test $(src))
    $(info bld in test $(bld))
endef

test = $(eval $(test_impl))

