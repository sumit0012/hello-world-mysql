# Hello World MySQL App

This is a simple Flask application that connects to a MySQL database and displays a message.

## Prerequisites
- Docker
- Docker Compose

## Build and Run

### **Build the Docker Image**
```sh
docker build -t sam3ctc/hello-world .

### **Build the Docker Containers**
docker compose up -d
docker compose down -v #To delete all the containers