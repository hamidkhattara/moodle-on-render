FROM bitnami/moodle:latest

COPY config.php /opt/bitnami/moodle/config.php
COPY install.sh /install.sh
RUN chmod +x /install.sh
