define test_impl
    test: $(1:%=$(bld)/%.ok)
    $(eval $1.src ?= $(wildcard $(src)/*Test.cpp))
    $(eval $1.libs += gtest_main gtest gmock)
    $(exec_impl)
    $(eval tests += $(target))
    $(info src in test $(src))
    $(info bld in test $(bld))
endef

define test
    $(eval $(test_impl))
endef





