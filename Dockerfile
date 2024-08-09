FROM php:8.1-apache

# ติดตั้ง dependencies และ extensions ที่จำเป็น
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql

# ติดตั้ง Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# ตั้งค่า working directory
WORKDIR /var/www/html

# คัดลอกไฟล์โปรเจคทั้งหมด
COPY . .

# ติดตั้ง dependencies ของ PHP
RUN composer install --no-interaction --no-dev --prefer-dist

# ตั้งค่าสิทธิ์การเข้าถึง
RUN chown -R www-data:www-data /var/www/html \
    && a2enmod rewrite

# เปิดพอร์ต 80
EXPOSE 80

# คำสั่งเริ่มต้น Apache
CMD ["apache2-foreground"]