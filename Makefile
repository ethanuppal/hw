TO_CLEAR	:=	$(shell find . -type f -name "*.out") \
				$(shell find . -type f -name "*.vcd")

DIRS_TO_CLEAR := $(shell find . -type d -name "obj_dir")

.PHONY: clean
clean:
	rm -f $(TO_CLEAR)
	rm -rf $(DIRS_TO_CLEAR)
