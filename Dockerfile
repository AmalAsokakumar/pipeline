FROM nginx:latest
RUN rm /etc/nginx/conf.d/default.conf
#COPY ./web/* /usr/share/nginx/html/
VOLUME /usr/share/nginx/html
VOLUME /etc/nginx

