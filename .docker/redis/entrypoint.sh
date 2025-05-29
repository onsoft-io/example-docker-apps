#!/usr/bin/env sh
set -e

cat <<EOF > /usr/local/etc/redis/users.acl
user default on >${REDIS_PASSWORD:-112233} ~* +@all
user ${REDIS_USERNAME:-dev} on >${REDIS_PASSWORD:-changeme} ~* +@all
EOF

exec redis-server /usr/local/etc/redis/redis.conf
