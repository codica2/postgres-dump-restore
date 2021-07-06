# Container for PostgreSQL backup database & copy to S3!

![](pgsql-backup-docker.png)

---
 
 **A simple docker image with postgresql and awscli to backup postgresql database to s3**

 ## Configuring


**ENV variables, required for postgresql dump:**

* PG_HOST
* PG_PORT
* PG_DB
* PG_NAME
* PG_PASS
* S3_BUCKET
* S3_PATH
* AWS_ACCESS_KEY_ID
* AWS_SECRET_ACCESS_KEY
* AWS_DEFAULT_REGION

## How to run
 ## Backup
**`PG_PORT` is optional**
To find `PG_HOST`, if you are not using ECS, type "docker network inspect `<NAME_OF_NETWORK>` and find DB container's IP in list"
```
docker run -d --name pg_dump \
  -e "POSTGRES_URL=postgresql://user:password@localhost"
  -e "AWS_ACCESS_KEY_ID=your_aws_access_key"
  -e "AWS_SECRET_ACCESS_KEY=your_aws_secret_access_key"
  -e "AWS_DEFAULT_REGION=us-west-1"
  -e "S3_BUCKET=your_aws_bucket"
  -e "S3_PATH=your_aws_path"
  -e "PG_PASS=post"
  -e "PG_PORT=5432"
  -e "PG_NAME=database_name"
  -e "PG_HOST=localhost"
  public.ecr.aws/o0j8c5i3/codica:psql_backups
```
**Use `BACKUP_CRON_SCHEDULE` for setting periodic backup**
```
docker run -d --name pg_dump \
  -e "BACKUP_CRON_SCHEDULE=0 2 0 0 0"
  -e "POSTGRES_URL=postgresql://user:password@localhost"
  -e "AWS_ACCESS_KEY_ID=your_aws_access_key"
  -e "AWS_SECRET_ACCESS_KEY=your_aws_secret_access_key"
  -e "AWS_DEFAULT_REGION=us-west-1"
  -e "S3_BUCKET=your_aws_bucket"
  -e "S3_PATH=your_aws_path"
  -e "PG_PASS=post"
  -e "PG_PORT=5432"
  -e "PG_NAME=database_name"
  -e "PG_HOST=localhost"
  public.ecr.aws/o0j8c5i3/codica:psql_backups
```

## License
Database backup is Copyright © 2015-2021 Codica. It is released under the [MIT License](https://opensource.org/licenses/MIT).

## About Codica

[![Codica logo](https://www.codica.com/assets/images/logo/logo.svg)](https://www.codica.com)

We love open source software! See [our other projects](https://github.com/codica2) or [hire us](https://www.codica.com/) to design, develop, and grow your product.
