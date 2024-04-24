FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y postgresql-client && \
    apt-get install -y cron

COPY backup.sh /backup.sh
RUN chmod 0744 /backup.sh

COPY config/backup-cron /etc/cron.d/backup-cron
RUN chmod 0644 /etc/cron.d/backup-cron

RUN touch /var/log/cron.log

COPY run-cron.sh /run-cron.sh
RUN chmod 0744 /run-cron.sh

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["/run-cron.sh"]
