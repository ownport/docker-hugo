#!/usr/bin/env sh
set -eu

HOST_IP_ADDR=`hostname -i`

case ${1} in
    hugo:server)
        exec hugo server --bind=${HOST_IP_ADDR} --baseUrl=http://${HOST_IP_ADDR}
        ;;
    hugo:newsite)
        exec hugo new site ${2}
        ;;
    help)
        echo 'Available options:'
        echo ' hugo:server                  - Starts Hugo server'
        echo ' hugo:newsite <sitename>      - Create new site'
        echo ' help                         - Displays the help'
        echo ' [command]                    - Execute the specified command, eg. bash.'
        ;;
    *)
        exec "$@"
        ;;
esac 