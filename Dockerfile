FROM centos:latest
MAINTAINER ashrafaws31@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd \
zip \
unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page277/cads.zip /var/www/html
WORKDIR /var/www/html
RUN unzip cads.zip
RUN cp -rvf  cads/* .
RUN rm -rf  cads
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
