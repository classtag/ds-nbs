#/bin/sh
set -e

export NB_UGD=$(id -u):$(id -g)
export NB_UID=$(id -u)
export NB_GID=$(id -g)
export NB_USER=$USER

cmd=$1
if [[ $cmd == "up" ]]; then
  nohup docker-compose up > /tmp/dsn.log 2>&1 &
  echo "running"
  sleep 5
  tail -n 20 /tmp/dsn.log
fi

if [[ $cmd == "down" ]]; then
  docker-compose down
  echo "shutdown"
fi
