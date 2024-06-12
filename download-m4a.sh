#!/bin/bash

IMAGE_NAME="youtube-dl"
DIR_NAME="files"

if [ "$USER" != "root" ]; then
	echo "Для выполнения скрипта нужны права sudo, запустите скрипт с правами суперпользователя"
	exit 0
fi

mkdir $DIR_NAME

if [ ! "$(docker image ls -q -f before=$IMAGE_NAME)" ]; then
	echo "Создание Docker образа..."
	docker build -t $IMAGE_NAME $PWD
fi

for url in $@ 
do
	docker run --rm -v $PWD/files:/home/files -w /home/files $IMAGE_NAME youtube-dl $url -x --audio-format m4a
done

chown seniorkonung:seniorkonung -R $PWD/files
