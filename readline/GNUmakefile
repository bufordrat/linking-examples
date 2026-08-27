PNAME = readline_demo
BNAME = readline-demo

all:
	docker build --progress=plain -t $(PNAME) .
	docker create --name $(BNAME)-extract $(PNAME)
	docker cp $(BNAME)-extract:/usr/local/bin/$(BNAME) ./musl/$(BNAME)
	docker rm $(BNAME)-extract
.PHONY: musl-build-exe

clean:
	dune clean $(PNAME) --display short || true
	docker rmi $(PNAME) 2> /dev/null || true
	rm musl/$(BNAME) || true
.PHONY: clean
