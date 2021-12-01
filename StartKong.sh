docker run -d --name kong-gateway \
  --network=kong-net \
  -e "KONG_DATABASE=postgres" \
  -e "KONG_PG_HOST=postgres11" \
  -e "KONG_PG_USER=kong" \
  -e "KONG_PG_PASSWORD=45q8tvhy11" \
  -e "KONG_PROXY_ACCESS_LOG=/dev/stdout" \
  -e "KONG_ADMIN_ACCESS_LOG=/dev/stdout" \
  -e "KONG_PROXY_ERROR_LOG=/dev/stderr" \
  -e "KONG_ADMIN_ERROR_LOG=/dev/stderr" \
  -e "KONG_ADMIN_LISTEN=0.0.0.0:8001, 0.0.0.0:8444 ssl" \
  -p 8000:8000 \
  -p 8443:8443 \
  -p 127.0.0.1:8001:8001 \
  -p 127.0.0.1:8444:8444 \
  kong:v2.6


docker run -d --name kong-admin \
  --network=kong-net \
  -e "HOST=0.0.0.0" \
  -e "PORT=1337" \
  -e "NODE_ENV=production" \
  -e "DB_ADAPTER=postgres" \
  -e "DB_HOST=postgres11" \
  -e "DB_PORT=5432" \
  -e "DB_DATABASE=kongadmin" \
  -e "DB_USER=kong" \
  -e "DB_PASSWORD=45q8tvhy11" \
  -p 1337:1337 \
  pantsel/konga:0.14.9

