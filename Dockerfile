FROM wordpress:php8.4-fpm-alpine

RUN set -ex; \
    apk add --no-cache --virtual .build-deps $PHPIZE_DEPS; \
    \
    pecl install redis-6.1.0; \
    docker-php-ext-enable redis; \
    \
    apk del .build-deps; \
    rm -rf /tmp/pear

CMD ["php-fpm"]
