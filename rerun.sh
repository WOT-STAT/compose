docker compose -p prod down
docker compose pull
docker compose -p prod -f docker-compose.yaml -f docker-compose.prod.yaml up -d --remove-orphans

docker compose -p dev down
docker compose pull
docker compose -p dev -f docker-compose.yaml -f docker-compose.dev.yaml up -d --remove-orphans
