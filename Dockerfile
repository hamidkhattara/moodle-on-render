FROM bitnami/moodle:latest

# Don't copy config.php — let Moodle generate it from env vars
COPY install.sh /install.sh
RUN chmod +x /install.sh
