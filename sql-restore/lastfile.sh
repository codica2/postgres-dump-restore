#!/bin/bash

if [[ "${#}" -lt 1 ]]
then
	echo "Supply dir"
	exit 1	
fi
DIR=${@}
if [[ ! -d "${DIR}" ]];
then
	echo "Dir doesnt exist"
	exit 1
fi
ls -Art ${DIR} | egrep "**sql" | tail -n 1
