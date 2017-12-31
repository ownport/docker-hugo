#!/usr/bin/env sh
set -eu

case ${1} in
    hugo:server)
        exec hugo server
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