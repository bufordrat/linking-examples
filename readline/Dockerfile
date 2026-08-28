FROM alpine:3.20 AS builder

RUN apk update && \
    apk upgrade && \
    apk add build-base --no-cache opam git && \
    apk add --no-cache readline-static readline-dev ncurses-static ncurses-dev

RUN addgroup ocamldev && adduser -G ocamldev -D ocamldev

USER ocamldev

RUN opam init --bare -a -y --disable-sandboxing \
    && opam update

RUN opam switch create docker-switch 5.2.0

WORKDIR /app

COPY dune dune-project readline-demo.opam readline_demo.ml ./

RUN opam install . --deps-only --yes

RUN opam exec -- dune build --release

FROM alpine:3.20 AS runtime

COPY --from=builder /app/readline_demo.exe /usr/local/bin/readline-demo

CMD  [ "/usr/local/bin/readline-demo" ]
