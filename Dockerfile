FROM golang:1.18-alpine AS builder

WORKDIR /app

COPY go.mod ./
COPY cmd ./cmd

RUN go build -o server ./cmd/server

FROM alpine:3.21

WORKDIR /app

COPY --from=builder /app/server .

EXPOSE 3000

USER nobody

CMD ["./server"]