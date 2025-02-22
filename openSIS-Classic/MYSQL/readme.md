openSIS-Classic\MYSQL\mysql-config\strict_mode.cnf
MYSQL\mysql-config\strict_mode.cnf

docker run --name my-mysql \
  -e MYSQL_ROOT_PASSWORD=my-secret-pw \
  -p 3306:3306 \
  -v mysql_data:/var/lib/mysql \
  -v /path/to/strict_mode.cnf:/etc/mysql/conf.d/strict_mode.cnf \
  -d mysql:8.0

  docker run --name my-mysql \
  -e MYSQL_ROOT_PASSWORD=my-secret-pw \
  -p 3306:3306 \
  -v mysql_data:/var/lib/mysql \
  -v /openSIS-Classic\MYSQL\mysql-config\strict_mode.cnf:/etc/mysql/conf.d/strict_mode.cnf \
  -d mysql:8.0

