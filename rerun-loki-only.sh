docker compose -p loki down;
docker compose -p loki -f docker-compose-loki-only.yaml pull;
docker compose -p loki -f docker-compose-loki-only.yaml up -d --remove-orphans;
