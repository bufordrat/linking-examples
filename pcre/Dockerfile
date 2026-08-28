FROM alpine:3.20 AS builder

RUN apk update && \
    apk upgrade && \
    apk add --no-cache build-base opam pcre2-dev pcre2 pkgconf

RUN addgroup ocamldev && adduser -G ocamldev -D ocamldev

USER ocamldev

RUN opam init --bare -a -y --disable-sandboxing \
    && opam update

RUN opam switch create docker-switch 5.2.0

WORKDIR /app

COPY dune dune-project pcre-demo.opam pcre_demo.ml ./

RUN opam install . --deps-only --yes

RUN opam exec -- dune build --release

FROM alpine:3.20 AS runtime

COPY --from=builder /app/pcre_demo.exe /usr/local/bin/pcre-demo

CMD  [ "/usr/local/bin/pcre-demo" ]
