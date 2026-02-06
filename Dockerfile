# Build stage
FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY go.mod ./
RUN go mod init example.com/myapp || true
COPY . .
RUN go build -o app

# Runtime stage
FROM alpine:3.19
WORKDIR /app
COPY --from=builder /app/app .
ARG ENV
ENV APP_ENV=$ENV
CMD ["./app"]
