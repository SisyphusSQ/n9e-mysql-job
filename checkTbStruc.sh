#!/bin/bash

#init
ENV="./.env"
DB=$1
TB=$2

function loadEnv() {
    if [ -z "$ENV" ]; then
        echo "请检查.env文件"
        exit 1
    else
        export $(grep -Ev '^#' "$ENV" | xargs)
    fi

}

function tableStruc() {
    echo "--------表结构-----------"
    mysql -h "$HOST" -P "$PORT" -u"$USER" -p"$PWD" -e "show create table $1.$2\G"

    echo "--------索引-----------"
    mysql -h "$HOST" -P "$PORT" -u"$USER" -p"$PWD" -e "show index from $1.$2\G"
}

loadEnv
tableStruc "$DB" "$TB"
