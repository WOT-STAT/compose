#!/bin/bash

# Start the watch command in the background
clickhouse-backup watch &

# Start the server command in the background
clickhouse-backup server &

# Wait for any process to exit
wait -n

# Exit with the status of the process that exited first
exit $?
