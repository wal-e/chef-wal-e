#!/bin/bash
#source/credit: https://gist.github.com/parente/826961
VENV=$1
if [ -z $VENV ]; then
    echo "usage: virtualenvhelper [virtualenv_path_to_activate] CMDS"
    exit 1
fi
. ${VENV}
shift 1
#echo "Executing $@ in ${VENV}"
exec "$@"
deactivate
