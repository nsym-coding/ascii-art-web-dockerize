Run the following commands in the terminal:

<!-- The -t below means you are tagging the image and you are creating it as
a Golang web api and the full stop means you are running in the current directory which is where the DockerFile is and that's where it'll look for the DockerFile-->
1. docker build -t golangwebapi .

2. docker run -p 8080:8080 -tid golangwebapi