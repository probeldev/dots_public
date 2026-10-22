FROM php:8.5.12-apache

# PHP extensions (mysqli, gd, curl и т.д. — как в старом gagalkoding/lamp)
RUN apt-get update && apt-get install -y --no-install-recommends \
        libpng-dev libjpeg62-turbo-dev libfreetype6-dev \
        libzip-dev libicu-dev libxml2-dev libcurl4-openssl-dev \
        libxslt1-dev libonig-dev \
        unzip git socat \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install \
        mysqli pdo_mysql gd zip intl mbstring exif bcmath xsl curl \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# ionCube Loader (multi-arch)
RUN ARCH=$(uname -m | sed 's/x86_64/x86-64/') \
    && curl -fsSL "https://downloads.ioncube.com/loader_downloads/ioncube_loaders_lin_${ARCH}.tar.gz" -o /tmp/ioncube.tar.gz \
    && tar xzf /tmp/ioncube.tar.gz -C /tmp \
    && PHP_EXT_DIR=$(php -r 'echo ini_get("extension_dir");') \
    && cp /tmp/ioncube/ioncube_loader_lin_8.5.so "$PHP_EXT_DIR" \
    && echo "zend_extension=${PHP_EXT_DIR}/ioncube_loader_lin_8.5.so" > /usr/local/etc/php/conf.d/00-ioncube.ini \
    && rm -rf /tmp/ioncube*

# Apache: docroot /app (монтируется ~/public_html), .htaccess включён
RUN a2enmod rewrite \
    && sed -ri 's!/var/www/html!/app!g' /etc/apache2/sites-available/000-default.conf /etc/apache2/apache2.conf \
    && { \
        echo '<Directory /app>'; \
        echo '    Options Indexes FollowSymLinks'; \
        echo '    AllowOverride All'; \
        echo '    Require all granted'; \
        echo '</Directory>'; \
    } > /etc/apache2/conf-available/app.conf \
    && a2enconf app

COPY php.ini /usr/local/etc/php/conf.d/99-custom.ini

# Composer
COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

COPY lamp-start /usr/local/bin/lamp-start
RUN chmod +x /usr/local/bin/lamp-start

CMD ["lamp-start"]
