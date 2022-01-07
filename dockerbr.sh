#!/bin/bash

docker build -t messiapi .

docker container run -p 8080:8080 --detach --name messi_goat messiapi