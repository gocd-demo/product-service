#!/bin/bash

CONTAINER_ID=$(docker run -d -p8081:80 -ti gocddemo/guestbook:v${GO_DEPENDENCY_LABEL_UPSTREAM})
npm install --prefix functional_tests
gauge install -d functional_tests
gauge run specs -d functional_tests
docker stop $CONTAINER_ID
docker rm $CONTAINER_ID
