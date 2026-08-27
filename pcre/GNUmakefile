PNAME = pcre_demo
BNAME = pcre-demo

all: dune-stuff
	docker build --progress=plain -t $(PNAME) .
	docker create --name $(BNAME)-extract $(PNAME)
	docker cp $(BNAME)-extract:/usr/local/bin/$(BNAME) ./musl/$(BNAME)
	docker rm $(BNAME)-extract
.PHONY: musl-build-exe

dune-stuff:
	dune build --display short || true
	dune clean --display short || true
.PHONY: dune-stuff

clean:
	docker rmi $(PNAME) 2> /dev/null || true
	rm musl/$(BNAME) || true
.PHONY: clean
