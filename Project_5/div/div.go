package div

// Divide returns the quotient of two integers.
func Divide(a int, b int) float64 {
    if b == 0 {
        return 0 // Handle division by zero appropriately.
    }
    return float64(a) / float64(b)
}
