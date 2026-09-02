PNAME = pure-ocaml-demo

all: dune-stuff
	docker build --progress=plain -t $(PNAME) .
	docker create --name $(PNAME)-extract $(PNAME)
	docker cp $(PNAME)-extract:/usr/local/bin/$(PNAME) ./musl/$(PNAME)
	docker rm $(PNAME)-extract
.PHONY: all

dune-stuff:
	dune build --display short || true
	dune clean --display short || true
.PHONY: dune-stuff

clean:
	docker rmi $(PNAME) 2> /dev/null || true
	rm musl/$(PNAME) || true
.PHONY: clean
