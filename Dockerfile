FROM centos:latest
MAINTAINER ashrafaws31@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*
RUN yum install -y httpd \
zip \
unzip
ADD https://www.free-css.com/assets/files/free-css-templates/download/page277/dryme.zip /var/www/html
WORKDIR /var/www/html
RUN unzip dryme.zip
RUN cp -rvf  laundry-service-website-template/* .
RUN rm -rf  laundry-service-website-template
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE 80
