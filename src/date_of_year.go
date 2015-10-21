package main

import (
	"fmt"
	"time"
)

//
// Today is 21-10-2015. This program print day from start of year to now.
// I can stdout to file and other program can read it
// You can change layout format if you would like to do
//

func main() {
	n := time.Now()

	for i := 1; i < 294; i++ {
		y := n.AddDate(0, 0, -i)
		// y := n.AddDate(years, months, days)
		const layout = "20060102"
		fmt.Println(y.Format(layout))
	}

}
