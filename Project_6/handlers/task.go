package handlers

import (
	"Project_6/models"
	"net/http"

	"github.com/gin-gonic/gin"
)

// GetTasks function retrieves all tasks from the database and sends them as JSON
func GetTasks(c *gin.Context) {
	var tasks []models.Task

	// Fetch all tasks from the database
	if err := models.DB.Find(&tasks).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to fetch tasks"})
		return
	}

	c.JSON(http.StatusOK, tasks)
}

// CreateTask function allows creating a new task
func CreateTask(c *gin.Context) {
	var newTask models.Task

	// Bind the JSON request body to the newTask object
	if err := c.ShouldBindJSON(&newTask); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid input"})
		return
	}

	// Save the new task to the database
	if err := models.DB.Create(&newTask).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to create task"})
		return
	}

	c.JSON(http.StatusCreated, newTask)
}

// UpdateTask function allows updating an existing task
func UpdateTask(c *gin.Context) {
	var task models.Task
	id := c.Param("id")

	// Fetch the task by its ID
	if err := models.DB.First(&task, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Task not found"})
		return
	}

	// Bind the updated data to the task object
	if err := c.ShouldBindJSON(&task); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid input"})
		return
	}

	// Save the updated task to the database
	if err := models.DB.Save(&task).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to update task"})
		return
	}

	c.JSON(http.StatusOK, task)
}

// DeleteTask function allows deleting a task
func DeleteTask(c *gin.Context) {
	id := c.Param("id")
	var task models.Task

	// Fetch the task by its ID
	if err := models.DB.First(&task, id).Error; err != nil {
		c.JSON(http.StatusNotFound, gin.H{"error": "Task not found"})
		return
	}

	// Delete the task from the database
	if err := models.DB.Delete(&task).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to delete task"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Task deleted successfully"})
}
