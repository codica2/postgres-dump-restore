#!/bin/bash
host=${PG_HOST}
port=${PG_PORT}
dbname=${PG_NAME}
user=${PG_USER}

export OPTIONS=$(echo "-h ${PG_HOST} -p ${PG_PORT} -U ${PG_USER}")
