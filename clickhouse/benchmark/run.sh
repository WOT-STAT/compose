# docker compose exec -d clickhouse bash benchmark/run.sh

clickhouse-benchmark -i 1000 -c 5 --database=WOT < benchmark/query.sql
