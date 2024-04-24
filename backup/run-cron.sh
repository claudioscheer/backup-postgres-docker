#!/bin/bash

# export environment variables
printenv | grep -v "no_proxy" >> /container.env

# start cron
cron -f
