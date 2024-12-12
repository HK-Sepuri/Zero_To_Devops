package main

import "fmt"

func add(a int, b int) int {
	return a + b
}

func subtract(a int, b int) int {
	return a - b
}

func multiply(a int, b int) int {
	return a * b
}

func divide(a int, b int) float64 {
	if b == 0 {
		return 0 // Handle division by zero appropriately in production code.
	}
	return float64(a) / float64(b)
}
func main() {
	fmt.Println("Addition Result:", add(5, 3))
	fmt.Println("Subtraction Result:", subtract(5, 3))
	fmt.Println("Multiplication Result:", multiply(5, 3))
	fmt.Println("Division Result:", divide(5, 3))
}
