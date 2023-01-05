# How to install

$ docker run --rm \
    --network=kong \
    pantsel/konga -c prepare -a postgres -u postgresql://kong:kong@kong-database:5432/konga

$ docker compose -f konga/docker-compose.yaml up -d
