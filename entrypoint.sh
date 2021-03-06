#!/bin/bash

# initialize arguments
OPTIND=1 
db=""
workdir=$PWD

while getopts "d:w:" opt; do
    case "$opt" in
    d) db=${OPTARG//[[:blank:]]/}
       ;;
    w) workdir=${OPTARG//[[:blank:]]/}
       ;;
    *) exit 1
    esac
done

shift $((OPTIND - 1))

[ "${1:-}" = "--" ] && shift

if [[ -z "$db" ]]; then
    echo  "Argument -t (template database) missing"
    exit 1
fi

cd "$workdir" || exit 1

db=${db//\\/\"}

echo "$db" > .env

prisma migrate deploy --preview-feature
