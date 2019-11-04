FROM php:7.3-fpm-alpine

COPY --from=composer /usr/bin/composer /usr/bin/composer

WORKDIR /var/www/iww
RUN addgroup coderunners && adduser -D composer coderunners && chown -R composer .
USER composer
RUN pwd && ls -altr
RUN composer install
USER root
RUN chown -R www-data .

