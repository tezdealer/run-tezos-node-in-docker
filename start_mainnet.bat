docker-compose -f node-setup-from-snapshot.docker-compose.yml --env-file mainnet.env up -d --force-recreate

timeout 10
