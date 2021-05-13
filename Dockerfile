FROM php:7.4.19-apache AS base
WORKDIR  /var/www/html/
EXPOSE 80
RUN apt-get update
RUN apt-get install unzip wget -y
RUN wget "https://formtools.org/download_file.php?file_type=core&file=FormTools3.0.20-20191109.zip" -O formtools.zip
RUN unzip formtools.zip
RUN cp -a formtools/. .
RUN rm -r formtools
RUN rm formtools.zip
RUN apt-get remove unzip wget -y
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
RUN chown -R www-data:www-data /var/www