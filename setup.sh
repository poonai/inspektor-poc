docker-compose up -d 

echo "postgres instance is warming up"

sleep 5

echo "seeding inspektor sample data"

psql "sslmode=disable host=localhost port=5432 dbname=postgres user=postgres password=postgrespass" < seed1.sql

docker-compose down

echo "intializing redash database"

docker-compose run server create_db

echo "starting the cluster"

docker-compose up