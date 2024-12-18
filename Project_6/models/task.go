package models

import (
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/sqlite" // Import SQLite dialect for GORM
)

// Task struct defines the Task model for GORM
type Task struct {
	ID          uint   `json:"id" gorm:"primary_key"`
	Name        string `json:"name"`
	Description string `json:"description"`
	Status      string `json:"status"`
	DueDate     string `json:"due_date"`
}

// DB is the global database connection object
var DB *gorm.DB

// InitializeDatabase function sets up the SQLite database and performs migration
func InitializeDatabase() {
	var err error
	// Open a connection to SQLite (this will create a new database file if it doesn't exist)
	DB, err = gorm.Open("sqlite3", "./tasks.db")
	if err != nil {
		panic("Failed to connect to the database!")
	}

	// Migrate the schema: this will create the 'tasks' table if it doesn't exist
	DB.AutoMigrate(&Task{})
}
