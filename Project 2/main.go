package main

import (
	"bufio"
	"encoding/json"
	"fmt"
	"os"
	"strings"
)

type Task struct {
	ID          int    `json:"id"`
	Description string `json:"description"`
	Completed   bool   `json:"completed"`
}

var tasks []Task
var nextID int = 1

const filename = "tasks.json"

func loadTasks() error {
	file, err := os.Open(filename)
	if err != nil {
		if os.IsNotExist(err) {
			return nil // File doesn't exist, that's okay
		}
		return err
	}
	defer file.Close()

	decoder := json.NewDecoder(file)
	err = decoder.Decode(&tasks)
	if err != nil {
		return err
	}

	for _, task := range tasks {
		if task.ID > nextID {
			nextID = task.ID
		}
	}
	nextID++

	return nil
}

func saveTasks() error {
	file, err := os.Create(filename)
	if err != nil {
		return err
	}
	defer file.Close()

	encoder := json.NewEncoder(file)
	err = encoder.Encode(tasks)
	if err != nil {
		return err
	}

	return nil
}

func addTask(description string) {
	task := Task{
		ID:          nextID,
		Description: description,
		Completed:   false,
	}
	tasks = append(tasks, task)
	nextID++
	fmt.Println("Task added successfully!")
}

func viewTasks() {
	if len(tasks) == 0 {
		fmt.Println("No tasks found.")
		return
	}
	fmt.Println("Your tasks:")
	for _, task := range tasks {
		status := " "
		if task.Completed {
			status = "[X]"
		}
		fmt.Printf("%d. %s %s\n", task.ID, status, task.Description)
	}
}

func deleteTask(id int) {
	for i, task := range tasks {
		if task.ID == id {
			tasks = append(tasks[:i], tasks[i+1:]...)
			fmt.Println("Task deleted successfully!")
			return
		}
	}
	fmt.Println("Task not found.")
}

func markTaskCompleted(id int) {
	for i, task := range tasks {
		if task.ID == id {
			tasks[i].Completed = true
			fmt.Println("Task marked as completed!")
			return
		}
	}
	fmt.Println("Task not found.")
}

func main() {
	err := loadTasks()
	if err != nil {
		fmt.Println("Error loading tasks:", err)
	}

	reader := bufio.NewReader(os.Stdin)

	for {
		fmt.Println("\nTo-Do List")
		fmt.Println("1. Add Task")
		fmt.Println("2. View Tasks")
		fmt.Println("3. Delete Task")
		fmt.Println("4. Mark Task Completed")
		fmt.Println("5. Quit")

		// Getting user choice
		fmt.Print("Enter your choice: ")
		choiceStr, _ := reader.ReadString('\n')
		choiceStr = strings.TrimSpace(choiceStr)

		var choice int
		_, err := fmt.Sscanf(choiceStr, "%d", &choice)
		if err != nil || choice < 1 || choice > 5 {
			fmt.Println("Invalid input.")
			continue
		}

		switch choice {
		case 1:
			fmt.Print("Enter task description: ")
			description, _ := reader.ReadString('\n')
			addTask(strings.TrimSpace(description))
		case 2:
			viewTasks()
		case 3:
			fmt.Print("Enter task ID to delete: ")
			var id int
			_, _ = fmt.Scanln(&id)
			deleteTask(id)
		case 4:
			fmt.Print("Enter task ID to mark as completed: ")
			var id int
			_, _ = fmt.Scanln(&id)
			markTaskCompleted(id)
		case 5:
			fmt.Println("Exiting...")
			err = saveTasks()
			if err != nil {
				fmt.Println("Error saving tasks:", err)
			}
			os.Exit(0)
		default:
			fmt.Println("Invalid choice.")
		}
	}
}
