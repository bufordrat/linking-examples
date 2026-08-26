FROM alpine:3.20 AS base

FROM base AS builder

RUN apk update && \
    apk upgrade && \
    apk add build-base --no-cache opam git && \
    apk add --no-cache pcre2-dev pcre2 pkgconf

RUN addgroup ocamldev && adduser -G ocamldev -D ocamldev

USER ocamldev

RUN opam init --bare -a -y --disable-sandboxing \
    && opam update

RUN opam switch create static-5.2.0 ocaml-variants.5.2.0+options ocaml-option-static

WORKDIR /app

COPY dune dune-project pcre-demo.opam pcre_demo.ml ./

RUN opam install . --deps-only --yes

RUN opam exec -- dune build --release

FROM base AS runtime

COPY --from=builder /app/pcre_demo.exe /usr/local/bin/pcre-demo

CMD  [ "/usr/local/bin/pcre-demo" ]
