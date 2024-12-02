#!/bin/bash

echo '# Remove Old Image #'
# docker image rm -f 590183784162.dkr.ecr.us-east-1.amazonaws.com/main_ai_chat_luminous || true
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 590183784162.dkr.ecr.us-east-1.amazonaws.com
docker pull 590183784162.dkr.ecr.us-east-1.amazonaws.com/main_ai_chat_luminous:main
# docker container rm -f main_ai_chat_luminous || true
docker run -dt \
	  --name ${ENVIRONMENT}_ai_chat_luminous \
	  -p ${PORT_AI_CHAT}:80 \
	  #-p 8080:80 
	   590183784162.dkr.ecr.us-east-1.amazonaws.com/main_ai_chat_luminous:main
docker rmi $(docker images -f "dangling=true" -q)

