package main

import (
	"fmt"
	"os"
)

func main() {
	env := os.Getenv("APP_ENV")
	api := os.Getenv("API_URL")

	fmt.Println("🚀 Go App Running")
	fmt.Println("Environment:", env)
	fmt.Println("API_URL:", api)
}
