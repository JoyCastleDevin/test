package main

import (
	"fmt"
	"time"
)

func main() {
	fmt.Println("Test CI/CD")
	fmt.Printf("%s %s\n", "Hello", "World")
	go func() {
		ticker := time.NewTicker(1 * time.Second)
		for {
			select {
			case <-ticker.C:
				fmt.Println("ticker ticker")
			case <-ticker.C:
				fmt.Println("ticker xxxxxxx")
			}
		}
	}()
	select {}
}
