#!/usr/bin/env sh
set -eu

HOST_IP_ADDR=`hostname -i`

case ${1} in
    hugo:version)
        exec hugo version
        ;;
    hugo:server)
        echo "[INFO] Server IP address: ${HOST_IP_ADDR}"
        exec hugo server --bind=${HOST_IP_ADDR} --baseUrl=http://${HOST_IP_ADDR}
        ;;
    hugo:server:debug)
        echo "[INFO] Server IP address: ${HOST_IP_ADDR}"
        exec hugo server --bind=${HOST_IP_ADDR} --baseUrl=http://${HOST_IP_ADDR} --log --debug
        ;;
    hugo:newsite)
        exec hugo new site ${2}
        ;;
    help)
        echo 'Available options:'
        echo ' hugo:version                 - Show Hugo version'
        echo ' hugo:server                  - Starts Hugo server'
        echo ' hugo:newsite <path>          - Create new site'
        echo ' help                         - Displays the help'
        echo ' [command]                    - Execute the specified command, eg. bash.'
        ;;
    *)
        exec "$@"
        ;;
esac 