## Prepare the Kong database:
docker run --rm --network=kong-net \
  -e "KONG_DATABASE=postgres" \
  -e "KONG_PG_USER=kong" \
  -e "KONG_PG_HOST=postgres11" \
  -e "KONG_PG_DATABASE=kong" \
  -e "KONG_PG_PORT=5432" \
  -e "KONG_PG_PASSWORD=45q8tvhy11" \
  -e "KONG_PASSWORD=45q8tvhy" \
  kong:v2.6 kong migrations bootstrap



