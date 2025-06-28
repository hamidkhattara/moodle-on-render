FROM bitnami/moodle:latest

COPY install.sh /install.sh
RUN chmod +x /install.sh

CMD [ "/install.sh" ]
