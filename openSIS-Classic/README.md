# openSIS Classic
Community Edition version 9.0 (Rel date: 12/31/2022)
Created by [OS4ED](https://www.os4ed.com/)

openSIS is an easy to use Student Information System for organizing student information and school-related operations to promote efficiency in K-12, trade schools and higher education school systems.

## Key Features

- Manage Student Data
- Manage Staff Data
- Manage School Data
- Course Manager
- Scheduling
- Attendance
- Grades
- Teacher Gradebook
- Progress Reports
- Report Cards
- Transcripts
- Built-in Communication
- Bulk data imports

## Installation

openSIS Community Edition requires
- Apache 2.4 or above
- MySQL 5.7, 8.0 or Maria DB 10.4.x
- PHP 8.x

[Installation Details](https://github.com/OS4ED/openSIS-Classic/blob/master/docs/openSIS-CE%20Installation%20Guide.pdf)


## License

openSIS is an Open Source Project licensed under the GNU General Public License, the full license can be found [here](https://github.com/OS4ED/openSIS-Classic/blob/master/docs/License.txt).


# Jira Ticket Solutions
## step 1: Studying the Developers Code
We studied the opensus code and came to the conclusion that the presence of css files, php files and a MySQL folder implied a frontend and backend service.
## step 2: We wrote a dockerfile to build an image for the frontendused a php base image.
The Dockerfile is placed in the root directory of the code. 
docker build -t my-php . It was ran and successfully built the my-php image.
## step 3: Frontend Containerization
the docker run command (docker rundocker run -d -p 8080:80 --name opensis ui my-php was ran on the my-php image to build the frontend service and also vieed on localhost:8080
## step 4: MySQL - Database - Backend
observing the MySQL folder we found the .cnf custom configuration file named strict_mode.cnf which we must include in the backend container.
we acheived this by mounting the volume and running the command which automatically copies the custom .cnf file into the /etc/mysql/conf.d usually loaded by MySQL by default.
rather than this command, docker run --name my-mysql -e MYSQL_ROOT_PASSWORD=abc123@$ -p 3306:3306 -v mysql_data:/var/lib/mysql -d mysql:8.0,
docker run --name my-mysql \
  -e MYSQL_ROOT_PASSWORD=my-secret-pw \
  -p 3306:3306 \
  -v mysql_data:/var/lib/mysql \
  -v /path/to/strict_mode.cnf:/etc/mysql/conf.d/strict_mode.cnf \
  -d mysql:8.0
was ran to ensure the customed .cnf file is included in the container.




# other commands ran in the process
ping production.cloudflare.docker.com : to check for connectivity to docker registry when we ran into some error messages.
docker system prune -af : restarted docker and deleted all build cache objects