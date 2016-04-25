#!/bin/sh

TOKEN=$( curl -X POST -u admin:ecirb2016 http://172.16.184.8:8080/api/myAPP/user/ | sed -e 's/.*token":"//' -e 's/".*$//' )
curl -X GET -H 'token: '${TOKEN} http://172.16.184.8:8080/api/myAPP/subnets/cidr/172.16.184.0/24/ | python -m json.tool
