#!/bin/bash

#init
ENV="./.env"

function loadEnv() {
    if [ -z "$ENV" ]; then
        echo "请检查.env文件"
        exit 1
    else
        export $(grep -Ev '^#' "$ENV" | xargs)
    fi

}

function deadLockCk() {
    echo "--------innodb status-----------"
    mysql -h "$HOST" -P "$PORT" -u"$USER" -p"$PWD" -e "show engine innodb status\G"

    echo "--------错误日志-----------"
    tail -n 50 "$ERR"
}

loadEnv
deadLockCk