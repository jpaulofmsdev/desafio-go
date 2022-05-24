FROM golang:latest AS build

WORKDIR /desafio

COPY . .

RUN go mod init jpaulofms/desafio-go && \
    go build

FROM scratch

WORKDIR /desafio

COPY --from=build /desafio/desafio-go .

CMD ["./desafio-go"]