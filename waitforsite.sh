#!/bin/bash
# wait-for-site.sh

#until curl -s --head  --request GET http://172.18.0.22:8080/petclinic/ | grep "200" > /dev/null; do >&2 echo "App is unavailable - sleeping" sleep 1 done >&2 echo "App is up - executing command" exec $cmd

