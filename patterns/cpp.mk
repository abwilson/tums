$(bld_root)/%.o: %.cpp | $(mkdir)
	$(COMPILE.cpp) $< -o $@
