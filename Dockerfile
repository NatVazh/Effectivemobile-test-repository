#За базовый образ возьмём легковесный alpine с докер хаб
FROM php:8.2-alpine

#Задаём рабочую директорию и копируем в неё содержимое текущего каталога с кодом приложения
WORKDIR /usr/src/my-php-app
COPY . /usr/src/my-php-app

#Устанавливаем локализацию
ENV TIMEZONE Europe/Moscow

# В контейнере открываем 9000 порт и запускаем сервер php, например, с помощью скрипта my-php-app.php
EXPOSE 9000
ENTRYPOINT ["php", "/usr/src/my-php-app.php"]
