test: test.native
	@./test.native

test.native: *.ml *.mli
	@corebuild -quiet -pkg oUnit -pkg str test.native

clean:
	rm -rf _build
	rm -f test.native

.PHONY: clean
