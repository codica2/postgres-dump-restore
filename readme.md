# Bash script for PostgreSQL backup/restore database & copy to S3!

![](pgsql-backup.png)

---

 **`main.sh`** - script for backup postgresql database. 
 
 **Menu script management for backup and restore. In this control menu, there are 4 options for development:**
* Backup docker local database
* Backup RDS database
* Restore docker local database
* Restore RDS database

 **To install, you need to download scripts and run**

 **At startup, the required data is requested**
  * S3_BUCKET, S3_PATH
  * AWS_ACCESS_KEY_ID
  * AWS_SECRET_ACCESS_KEY
  * AWS_REGION
  * RDS_HOST
  * RDS_DB 
  
 **They need to copy the backup to s3, if you want to make a backup just locally - you can just press Enter to skip.**
## License
Database backup/restore is Copyright © 2015-2021 Codica. It is released under the [MIT License](https://opensource.org/licenses/MIT).

## About Codica

[![Codica logo](https://www.codica.com/assets/images/logo/logo.svg)](https://www.codica.com)

We love open source software! See [our other projects](https://github.com/codica2) or [hire us](https://www.codica.com/) to design, develop, and grow your product.
