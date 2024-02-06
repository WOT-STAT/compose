docker compose -p prod down;
docker compose -p prod -f docker-compose.yaml -f docker-compose.prod.yaml pull;
docker compose -p prod -f docker-compose.yaml -f docker-compose.prod.yaml up -d --remove-orphans;
