package main

import "fmt"

type item struct {
	x int
	y int
}

func main() {
	// fmt.Println("Test CI/CD")
	// fmt.Printf("%s %s\n", "Hello", "World")
	// go func() {
	// 	ticker := time.NewTicker(1 * time.Second)
	// 	for {
	// 		select {
	// 		case <-ticker.C:
	// 			fmt.Println("ticker yyyyyyyyyy")
	// 		case <-ticker.C:
	// 			fmt.Println("ticker bbbbbbbbbb")
	// 		}
	// 	}
	// }()
	// select {}
	item1 := item{
		x: 1,
		y: 2,
	}
	item2 := item{
		x: 3,
		y: 4,
	}
	item3 := item{
		x: 5,
		y: 6,
	}
	item4 := item{
		x: 7,
		y: 8,
	}
	list := []item{item1, item2, item3, item4}
	list2 := make([]*item, 0, 10)
	for _, v := range list {
		fmt.Printf("%p\n", &v)
		list2 = append(list2, &v)
	}
	for _, v := range list2 {
		fmt.Println("list2", v)
	}
}
