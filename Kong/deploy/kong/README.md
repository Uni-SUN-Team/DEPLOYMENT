# How to install

$ docker compose -f db/docker-compose.yaml up -d

$ docker run --rm \
    --network=kong \
    -e "KONG_DATABASE=postgres" \
    -e "KONG_PG_HOST=kong-database" \
    -e "KONG_PG_DB=kong" \
    -e "KONG_PG_USER=kong" \
    -e "KONG_PG_PASSWORD=kong" \
    -e "KONG_CASSANDRA_CONTACT_POINTS=kong-database" \
    kong kong migrations bootstrap

$ docker compose -f kong/docker-compose.yaml up -d
