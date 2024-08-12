#!/bin/bash
set -e

# Update crontab with Whenever
bundle exec whenever --update-crontab

# Start the cron service
cron -f
