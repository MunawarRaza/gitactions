#!/bin/bash

docker image rm -f 590183784162.dkr.ecr.us-east-1.amazonaws.com/main_ai_chat_luminous || true
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 590183784162.dkr.ecr.us-east-1.amazonaws.com
docker pull 590183784162.dkr.ecr.us-east-1.amazonaws.com/main_ai_chat_luminous:latest
docker container rm -f main_ai_chat_luminous || true
docker run -dt \
	  --name main_ai_chat_luminous \
	  -p 8080:80 
	   590183784162.dkr.ecr.us-east-1.amazonaws.com/main_ai_chat_luminous:latest
docker rmi $(docker images -f "dangling=true" -q)

