package main

import (
	"Project_6/handlers"
	"Project_6/models"

	"github.com/gin-gonic/gin"
)

func main() {
	// Initialize the database
	models.InitializeDatabase()

	// Create a new Gin router
	r := gin.Default()

	// Define the GET route for "/tasks"
	r.GET("/tasks", handlers.GetTasks)

	// Define the POST route for creating a new task
	r.POST("/tasks", handlers.CreateTask)

	// Define the PUT route for updating a task
	r.PUT("/tasks/:id", handlers.UpdateTask)

	// Define the DELETE route for deleting a task
	r.DELETE("/tasks/:id", handlers.DeleteTask)

	// Start the Gin server on port 8080
	r.Run(":8080")
}
