FROM golang:1.21.3-alpine AS builder

WORKDIR /app

COPY . .

RUN go build -o main .

FROM scratch

COPY --from=builder /app/main /app/main

ENTRYPOINT ["/app/main"]
