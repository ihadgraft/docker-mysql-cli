# Import a database

## Example (docker-compose)

## Service setup

    services:
      sql-cli:
        image: dukewebservices/mysql-cli:latest
        environment:
          ENV STORAGE_DIRECTORY: "/var/storage"
          ENV MYSQL_DATABASE: "app"
          ENV MYSQL_USER: "app"
          ENV MYSQL_PASSWORD: "test1234"
          ENV MYSQL_HOST: "db"
          ENV MYSQL_PORT: 3306
          ENV DATESTAMP_FORMAT: "%Y%m%d-%H%M%S"

## Executing

Interactively import a database from STORAGE_DIRECTORY:

    docker-compose run sql-cli import
    
Dump a database into STORAGE_DIRECTORY:

    docker-compose run sql-cli dump

Launch a MySQL CLI:

    docker-compose run sql-cli cli
