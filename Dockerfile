FROM php:8.1-fpm

ARG ROOT=/app
ARG APP_ENV
ARG APP_PORT

ENV APP_ENV $APP_ENV
ENV PORT $APP_PORT

# Install and Update Libraries
RUN apt-get update && apt-get install -y autoconf gcc bash g++ make wget unzip libaio1 libaio-dev libxml2 libxml2-dev iputils-ping gettext-base nginx supervisor

# Copy config files to container
COPY /devops/supervisor/supervisor.conf /etc/supervisord.conf
COPY /devops/nginx/default.conf.template /etc/nginx/conf.d/default.conf.template
COPY /devops/nginx/nginx.conf /etc/nginx/nginx.conf
COPY /devops/php-fpm/php.ini /usr/local/etc/php/conf.d/app.ini
COPY /devops/php-fpm/php-fpm.conf /usr/local/etc/php-fpm.d/www.conf
COPY /devops/php-fpm/error_reporting.ini /usr/local/etc/php/conf.d/error_reporting.ini

COPY public $ROOT/public
COPY storage $ROOT/storage

ADD /devops/scripts/entrypoint.sh /
RUN chmod +x /entrypoint.sh

CMD ["/bin/bash", "-c", "/entrypoint.sh ${PORT}"]
