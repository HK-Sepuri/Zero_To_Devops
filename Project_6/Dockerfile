# Use the official Go image as the base image
FROM golang:1.23.4-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy go.mod and go.sum files to the container
COPY go.mod go.sum ./

# Download the Go dependencies (it will cache them if the go.mod and go.sum files are not changed)
RUN go mod tidy

# Copy the entire project into the container
COPY . .

# Build the Go application
RUN go build -o task-manager-api .

# Expose port 8080 for the application
EXPOSE 8080

# Run the Go application
CMD ["./task-manager-api"]
