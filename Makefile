TO_CLEAR	:=	$(shell find . -type f -name "*.out") \
				$(shell find . -type f -name "*.vcd")

.PHONY: clean
clean:
	rm -f $(TO_CLEAR)
	