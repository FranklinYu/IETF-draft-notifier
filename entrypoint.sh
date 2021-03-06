#!/bin/sh

# Ensures that database is ready and up-to-date.

try_count=${TRY_COUNT:-5}
connected=false

for i in $(seq $try_count); do
	echo "Trying to connect to database ($i/$try_count)..."
	if bundle exec rake db:create 2> /tmp/db-error-log-$i.txt; then
		connected=true
		cat /tmp/db-error-log-$i.txt
		echo 'Successfully connect to database!'
		break
	else
		sleep 1
		echo "Failed to connect to database. Retrying in a second."
	fi
done

if $connected; then
	if bundle exec rake db:migrate; then
		exec "$@"
	else
		status=$?
		echo "ERROR: migration failed"
		exit $status
	fi
else
	echo "Failed to connect to database [$DATABASE_URL]."
	exit 1
fi
