#!/bin/sh

# Create repository directory
[ ! -d $PINTO_REPOSITORY_ROOT ] && mkdir -p $PINTO_REPOSITORY_ROOT
[ ! -d $PINTO_REPOSITORY_ROOT/.pinto ] && pinto init

pintod --root $PINTO_REPOSITORY_ROOT --port $SERVER_PORT
