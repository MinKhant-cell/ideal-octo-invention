# Build stage
FROM golang:1.25-alpine AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod tidy

COPY . .
RUN go build -o app

# Runtime stage
FROM alpine:3.19
WORKDIR /app
COPY --from=builder /app/app .
ARG ENV
ENV APP_ENV=$ENV
CMD ["./app"]
