#!/bin/bash

echo "⚙️ Starting Moodle install script..."

# Wait for PostgreSQL to be ready
until PGPASSWORD="$MOODLE_DATABASE_PASSWORD" psql -h "$MOODLE_DATABASE_HOST" -U "$MOODLE_DATABASE_USER" -d "$MOODLE_DATABASE_NAME" -c '\q' 2>/dev/null; do
  echo "⏳ PostgreSQL not ready, waiting..."
  sleep 3
done

echo "✅ PostgreSQL is ready. Launching Moodle setup..."

# Remove HTTPS vhost to avoid Apache errors if HTTPS is not enabled
rm -f /opt/bitnami/apache/conf/vhosts/moodle-https-vhost.conf

# Run Bitnami Moodle setup script
exec /opt/bitnami/scripts/moodle/run.sh
