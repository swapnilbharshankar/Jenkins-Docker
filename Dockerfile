FROM ubuntu:16.04
RUN apt-get update 
RUN apt-get install apache2 -y
RUN apt-get install apache2-utils -y
RUN apt-get clean
EXPOSE 8088
CMD [“apache2ctl”, “-D”, “FOREGROUND”]