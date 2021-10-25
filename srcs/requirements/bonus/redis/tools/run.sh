
sed -i "s|# maxmemory <bytes>|maxmemory 256mb|g" /etc/redis.conf
sed -i "s|# maxmemory-policy noeviction|maxmemory-policy allkeys-lfu|g" /etc/redis.conf
# echo "extension=redis" > /etc/php7/conf.d/20_redis.ini
redis-server --daemonize no --protected-mode no