FROM postgres:13.3-alpine

MAINTAINER codica <devops.codica@gmail.com>

ENV PGDATA /var/lib/postgresql/data

RUN apk upgrade --no-cache && \
    apk add --update-cache \
    postgresql-client \
    python3 \
    python3-dev \
    py3-pip \
    postgresql \
    postgresql-contrib && \
      pip3 install --user --upgrade pip && \
      pip3 install --upgrade awscli --no-warn-script-location && \
    mkdir -p /sql-backup 
ENV S3_PATH=sql-backup AWS_DEFAULT_REGION=eu-central-1

COPY backup.sh /usr/local/bin/backup
COPY entrypoint.sh /usr/local/bin/entrypoint
COPY options.sh /usr/local/bin/options
EXPOSE 5432

ENTRYPOINT /usr/local/bin/entrypoint

