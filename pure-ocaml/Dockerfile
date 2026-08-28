FROM alpine:3.20 AS builder

RUN apk update && \
    apk upgrade && \
    apk add --no-cache build-base opam git

RUN addgroup ocamldev && adduser -G ocamldev -D ocamldev

USER ocamldev

RUN opam init --bare -a -y --disable-sandboxing \
    && opam update

RUN opam switch create docker-switch 5.2.0

WORKDIR /app

COPY dune dune-project pure-ocaml-demo.opam pure_ocaml_demo.ml ./

RUN opam install . --deps-only --yes

RUN opam exec -- dune build --release

FROM alpine:3.2 AS runtime

COPY --from=builder /app/pure_ocaml_demo.exe /usr/local/bin/pure-ocaml-demo

CMD  [ "/usr/local/bin/pure-ocaml-demo" ]
