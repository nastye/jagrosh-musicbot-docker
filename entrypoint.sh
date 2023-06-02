#!/bin/sh

if [ ! -z "$1" ]; then
  exec $1
  exit 0
fi

if [ -z "$TOKEN" ]; then
  echo \$TOKEN not set
  exit 1
else
  echo "token = $TOKEN" >> /app/config.txt
fi

if [ -z "$OWNER" ]; then
  echo \$OWNER not set
  exit 1
else
  echo "owner = $OWNER" >> /app/config.txt
fi

if [ -z "$PREFIX" ]; then
  echo \$PREFIX not set
  exit 1
else
  echo "prefix = \"$PREFIX\"" >> /app/config.txt
fi

java -Dnogui=true -jar /app/JMusicBot.jar