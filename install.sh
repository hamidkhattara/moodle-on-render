#!/bin/bash

rm -f /opt/bitnami/apache/conf/vhosts/moodle-https-vhost.conf

echo "⚙️ Starting Moodle install script..."

# Wait for the PostgreSQL database to be ready
echo "⏳ Waiting for database to be ready..."

until PGPASSWORD="$MOODLE_DATABASE_PASSWORD" psql -h "$MOODLE_DATABASE_HOST" -U "$MOODLE_DATABASE_USER" -d "$MOODLE_DATABASE_NAME" -c '\q' 2>/dev/null; do
  echo "⏳ PostgreSQL is unavailable - sleeping"
  sleep 3
done

echo "✅ PostgreSQL is up - continuing..."

# Run the Bitnami Moodle startup script
exec /opt/bitnami/scripts/moodle/run.sh
