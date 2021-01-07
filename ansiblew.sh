#!/bin/sh

docker run --rm -it --network=host -v$(pwd):/ansible -v ~/.ssh/id_rsa:/root/.ssh/id_rsa mgerhardy/ansible:2.9-alpine "$@"
