#!/bin/sh
 
answers() {
    echo --
    echo SomeState
    echo SomeCity
    echo SomeOrganization
    echo SomeOrganizationalUnit
    echo localhost.localdomain
    echo root@localhost.localdomain
}

if [ $# -eq 0 ] ; then
    echo "Usage: `basename $0` file_name_prefix"
    exit 0
fi

PREFIX=$1

answers | /usr/bin/openssl req -newkey rsa:2048 -keyout $PREFIX.key -out $PREFIX.crt -nodes -x509 -days 3650 2> /dev/null
