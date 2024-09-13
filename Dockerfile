FROM httpd

ADD ./html/ /usr/local/apache2/htdocs/

EXPOSE 8081
