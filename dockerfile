FROM golang:1.17.5
RUN mkdir /app
ADD . /app
WORKDIR /app
COPY go.mod .
RUN go build -o main
EXPOSE 8080
ENTRYPOINT [ "/app/main" ]