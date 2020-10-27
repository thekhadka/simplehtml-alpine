FROM alpine:3.12.1

RUN apk update && \
    apk add nginx && \
    mkdir /run/nginx/ /var/www/html && \
    touch /run/nginx/nginx.pid && \
    chown nginx:nginx /run/nginx -R

COPY index.html /var/www/html
COPY default.conf /etc/nginx/conf.d/

RUN  chown nginx:nginx /var/www/html -R

EXPOSE 8080

USER nginx

ENTRYPOINT ["nginx", "-g", "daemon off;"]
