#!/bin/bash
chmod 700 ~/tunnel.sh
crontab -e

# paste this into the terminal when the crontab -e opens => */1 * * * * ~/tunnel.sh > tunnel.log 2>&1