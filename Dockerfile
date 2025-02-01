FROM ubuntu:20.02                  
#base image with tag 20.04
EXPOSE 3000 			            
#expose port 3000
RUN apt update		                
#Best practice to always update your software (security)
RUN apt install python3-pip -y 	    
#
#means that most likely python app
WORKDIR /app		                
#basically a directory where all files will be in.
COPY . . 	                        
#means copy from the work space to the directory of WORKDIR(current working directory) i.e copy all file(jenkinsfile, readme app.py(the actual code), docker-compose.yml, requirement.txt and paste in the current working directory (app).
RUN pip3 intall -r requirement.txt  
#pip is python package manager and this will basically install all library in the requirement .txt file
CMD python 3 app.py                 
#Default command to start a container from this image (python3 app.py)
USER  deamon                              
#Allows you use or create a user that is not a default root user. 



