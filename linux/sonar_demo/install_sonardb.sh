#!/bin/bash 
source ../config.sh 
SONARSQL_FILE=sonardb.sql
mysql -u${MYSQL_USER} -p${MYSQL_PWD} < ${SONARSQL_FILE}
