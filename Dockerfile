FROM golang:1.18-alpine AS builder

WORKDIR /usr/src/app

COPY . .

RUN go build -o /bin/hello

FROM scratch

COPY --from=builder /bin/hello /bin/hello

ENTRYPOINT ["/bin/hello"]