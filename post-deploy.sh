#!/bin/bash

filename=deploy_log.txt
echo -e "$(date): \$ wp acorn view:cache\n$(wp acorn view:cache 2>&1)" >> $filename

# View your deploy log
# https://[your-wp-install-name].wpengine.com/deploy_log.txt
