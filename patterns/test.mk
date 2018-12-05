%Test: | $(mkdir)
	$(LINK.cpp) -o $@ $^ 

%.ok: %
	$<
	touch $@
