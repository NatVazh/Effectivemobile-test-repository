#За базовый образ возьмём легковесный alpine с докер хаб
FROM php:8.2-alpine

#Задаём рабочую директорию и копируем в неё содержимое текущего каталога с кодом приложения
WORKDIR /usr/src/web_php
COPY . /usr/src/web_php

#Устанавливаем локализацию
ENV TIMEZONE Europe/Moscow
RUN apk add --no-cache tzdata \
    && cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
    && echo "${TIMEZONE}" > /etc/timezone \
    && apk del tzdata

# Установка необходимых PHP расширений
RUN docker-php-ext-install pdo pdo_mysql

# В контейнере открываем 9000 порт и запускаем сервер php, например, с помощью скрипта web_php.php
EXPOSE 9000
ENTRYPOINT ["php", "/usr/src/web_php/web_php.php"]
