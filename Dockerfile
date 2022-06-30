FROM golang:latest AS builder

WORKDIR /go/src

COPY ./src /go/src

RUN go build challenge.go

FROM scratch

WORKDIR /

COPY --from=builder /go/src/challenge .

ENTRYPOINT [ "./challenge" ]