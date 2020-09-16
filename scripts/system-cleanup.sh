#!/bin/bash

for DIMG in `docker images -q -a | grep -v $(docker images | grep hadolint | awk '{print $3}')`
	do
		docker image rm -f ${DIMG}
done