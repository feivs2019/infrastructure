FROM nginx

MAINTAINER BcRikko

ADD ./www /root/www
ADD ./app.conf /etc/nginx/conf.d/app.conf
ADD ./keys/server.crt /etc/nginx/server.crt
ADD ./keys/server.key /etc/nginx/server.key

RUN mkdir /root/logs
RUN chmod 755 -R /root
RUN chmod 400 /etc/nginx/server.key

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]