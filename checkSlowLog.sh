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

function showSlowLog() {
    echo "--------slow-log-----------"
    tail -n 70 "$SLOWLOG"
}

loadEnv
showSlowLog
