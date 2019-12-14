#! /bin/bash
OPERATION=$1
NAME=$2
VERSION=$3

if [ "${OPERATION}" != "sv" -o $# -lt 2 ]; then
    echo "Usage: sh $0 sv NAME VERSION"
    exit -1;
fi
if [ $# -eq 2 ]; then
    VERSION=`date "+%s"`
fi

if [ "${NAME}" = "au" ]; then
    NAME="hotswapping/autoUpdate"
elif [ "${NAME}" = "ex" ]; then
    NAME="hotswapping/exsample"
else
    echo "Illegal name[${NAME}]"
    exit -1;
fi

curl "http://127.0.0.1:5675/admin?name=${NAME}&version=${VERSION}"
