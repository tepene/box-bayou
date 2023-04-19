#!/bin/bash

# starship.rs - get distrobox container name
container_name="$(test -e /run/.containerenv && . /run/.containerenv && echo "$name")"
echo $container_name

if [ -z "$container_name" ] ; then
    exit 1
fi
exit 0
