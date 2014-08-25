package main

import "net/http"
import "fmt"
import "log"
import "html"

func main() {
	http.HandleFunc("/bar", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, %q\n", html.EscapeString(r.URL.Path))
	})
	log.Fatal(http.ListenAndServe(":8765", nil))

}
