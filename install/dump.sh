#!/bin/bash
echo "
=================
   Start DUMP
=================
"
cd ../

export $(cat .env | grep -v '#' | xargs)

#Check Database Exist
echo "Process..."
docker exec -it ${DB_SERVER} /bin/sh -c "mysql --host=${DB_SERVER} --password=${DB_PASSWORD} --port=${DB_PORT} --user=${DB_USER} ${DB_DATABASE} < /var/lib/mysql/dump.sql"

echo "
=================
   DUMP FINISH

"

echo "Finish Dump"
echo "Open: ${CRAFT_URL}"