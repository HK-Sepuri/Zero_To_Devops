package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	// Serve static files from the "static" directory
	fs := http.FileServer(http.Dir("static"))
	http.Handle("/static/", http.StripPrefix("/static/", fs))

	// Define a handler for the root URL
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, "<h1>Welcome to My Web Server!</h1>")
		fmt.Fprintln(w, "<p>Visit <a href='/static/index.html'>this link</a> to see a static page.</p>")
	})

	// Start the server on port 8080
	log.Println("Starting server on :8080")
	err := http.ListenAndServe(":8080", nil)
	if err != nil {
		log.Fatal(err)
	}
}
