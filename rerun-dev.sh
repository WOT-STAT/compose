mkdir -p ../wot-src-data-dev;
chown -R 1000:1000 ../wot-src-data-dev;

docker compose -p dev down;
docker compose -p dev -f docker-compose.yaml -f docker-compose.dev.yaml pull;
docker compose -p dev -f docker-compose.yaml -f docker-compose.dev.yaml up -d --remove-orphans;
