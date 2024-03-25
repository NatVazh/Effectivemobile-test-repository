# Используем официальный образ PHP с поддержкой FPM (FastCGI Process Manager)
FROM php:8.0-fpm

#Устанавливаем локализацию
ENV TIMEZONE Europe/Moscow
RUN apk add --no-cache tzdata \
    && cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
    && echo "${TIMEZONE}" > /etc/timezone \
    && apk del tzdata
    
# Установка дополнительных зависимостей
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Устанавливаем рабочую директорию
WORKDIR /var/www/html

# Копируем исходный код приложения в контейнер
COPY . /var/www/html

# Открываем порт 9000
EXPOSE 9000

ENTRYPOINT ["php-fpm"]
