PNAME = pure_ocaml_demo
BNAME = pure-ocaml-demo

dune-stuff:
	dune build --display short || true
	dune clean --display short || true
.PHONY: dune-stuff

all: dune-stuff
	docker build --progress=plain -t $(PNAME) .
	docker create --name $(BNAME)-extract $(PNAME)
	docker cp $(BNAME)-extract:/usr/local/bin/$(BNAME) ./musl/$(BNAME)
	docker rm $(BNAME)-extract
.PHONY: musl-build-exe

clean:
	docker rmi $(PNAME) 2> /dev/null || true
	rm musl/$(BNAME) || true
.PHONY: clean
