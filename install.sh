#!/bin/bash

echo "⚙️ Starting Moodle install script..."

# Define default config values
MOODLE_URL=${MOODLE_URL:-http://localhost:8080}
DB_HOST=${MOODLE_DATABASE_HOST:-db}
DB_PORT=${MOODLE_DATABASE_PORT_NUMBER:-5432}
DB_NAME=${MOODLE_DATABASE_NAME:-moodle}
DB_USER=${MOODLE_DATABASE_USER:-moodleuser}
DB_PASS=${MOODLE_DATABASE_PASSWORD:-moodlepass}
DB_TYPE=${MOODLE_DATABASE_TYPE:-pgsql}

# Wait for database to be ready
echo "⏳ Waiting for database..."
until pg_isready -h "$DB_HOST" -p "$DB_PORT" -U "$DB_USER"; do
  sleep 2
done
echo "✅ Database is ready."

# Check if Moodle is already installed
if [ -f /bitnami/moodle/config.php ]; then
  echo "✅ Moodle is already installed."
  exit 0
fi

# Run Moodle install
echo "🚀 Installing Moodle..."
/opt/bitnami/moodle/admin/cli/install.php \
  --non-interactive \
  --agree-license \
  --wwwroot="$MOODLE_URL" \
  --dataroot=/bitnami/moodledata \
  --dbtype="$DB_TYPE" \
  --dbhost="$DB_HOST" \
  --dbport="$DB_PORT" \
  --dbname="$DB_NAME" \
  --dbuser="$DB_USER" \
  --dbpass="$DB_PASS" \
  --fullname="AMA Moodle" \
  --shortname="AMA" \
  --adminuser="admin" \
  --adminpass="IRT1234@" \
  --adminemail="admin@example.com"

echo "✅ Moodle installation complete!"
