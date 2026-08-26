PNAME = pcre_demo

all:
	docker build --progress=plain -t $(PNAME) .
.PHONY: musl-build-exe

clean:
	dune $(PNAME) --display short
.PHONY: clean
