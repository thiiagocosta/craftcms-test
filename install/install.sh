#!/bin/bash
echo "
===============================
Start Install CraftCMS for Test
===============================
"
cd ../

# Create ENV File.
if [ ! -e .env ]; then
  echo "Creating .env file"
  if ( cp .env.example .env ); then
    echo ".env file successfully created!"
  fi
fi

export $(cat .env | grep -v '#' | xargs)

#Check Composer
if [ ! -e composer.phar ]; then
  echo "Composer: Download Composer.phar"
  curl -s https://getcomposer.org/installer | php
fi

#Check Vendor
if [ ! -d "vendor" ]; then
  echo "Composer: Install"
  php composer.phar install --dev
fi

#Docker

#Docker Check
if ( docker --version ) then
  echo "I can feel the presence of docker!"
else
  echo "You should install docker first!"
fi

#Docker Clean:
if ( docker stop $(docker ps -aq) && docker rm $(docker ps -qa) && docker network prune -f ); then
  echo "Docker: All clean!"
fi

#Docker UP:
if ( docker-compose up -d); then
  echo "Starting all containers..."
fi

echo 
"
======= HOSTS =========

Please, add the lines below in your /etc/hosts 

#CraftCMS Test
127.0.0.1   ${CRAFT_URL}

======== DUMP =========

Wait for the database container to complete, and next execute:

Please, Excute: dump.sh

=======================

"
echo "Finish Install"
echo "Open: ${CRAFT_URL}"