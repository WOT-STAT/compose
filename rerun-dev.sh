docker compose -p dev down;
docker compose -p dev -f docker-compose.yaml -f docker-compose.dev.yaml pull;
docker compose -p dev -f docker-compose.yaml -f docker-compose.dev.yaml up -d --remove-orphans;
