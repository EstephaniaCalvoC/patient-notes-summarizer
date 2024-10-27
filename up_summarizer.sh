#! /bin/bash

echo "Starting MySQL"
docker compose -f ehr_mysql/compose.yaml up --build -d


echo "Waiting for MySQL to start"
until docker exec ehr_mysql mysqladmin ping --silent; do
    echo "Waiting for MySQL to start..."
    sleep 60
done

echo "Starting Django"
docker compose -f back/compose.yaml up --build