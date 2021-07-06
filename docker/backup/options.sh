#!/bin/bash
host=${PG_HOST}
port=${PG_PORT}
dbname=${PG_NAME}
user=${PG_USER}

export OPTIONS=$(echo --host ${PG_HOST} --port ${PG_PORT} -d ${PG_NAME} -U ${PG_USER})
