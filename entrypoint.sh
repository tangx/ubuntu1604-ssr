#!/bin/bash
#
#

source /etc/profile
cd /shadowsocksr/shadowsocks

# if [ "$#" == 0 ] || [ "$1" == "server.py" ]
if [ "$1" == "server.py" ]
then
{
    shift 
    SSR_PASS=${SSR_PASS:=taxTOdeath}
    python server.py -k $SSR_PASS $@
}
fi

exec "$@"