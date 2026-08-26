PNAME = pcre_demo
BNAME = pcre-demo

all:
	docker build --progress=plain -t $(PNAME) .
	docker create --name $(BNAME)-extract $(PNAME)
	docker cp $(BNAME)-extract:/usr/local/bin/$(BNAME) ./musl/$(BNAME)
	docker rm $(BNAME)-extract
.PHONY: musl-build-exe

clean:
	dune $(PNAME) --display short
	docker rmi $(PNAME) 2> /dev/null || true
	rm musl/$(BNAME) || true
.PHONY: clean
