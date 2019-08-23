FROM ubuntu:14.04

LABEL Author="Virink <virink@outlook.com>"
LABEL Blog="https://www.virzz.com"

COPY src/ /var/www/html/

RUN sed -i 's/http:\/\/archive.ubuntu.com\/ubuntu\//http:\/\/mirrors.tuna.tsinghua.edu.cn\/ubuntu\//g' /etc/apt/sources.list && \
    sed -i '/security/d' /etc/apt/sources.list && \
    apt-get update -y && \
    apt-get -yqq install supervisor mariadb-server apache2 php5 libapache2-mod-php5 \
    php5-mysql php5-mcrypt php5-memcache && \
    # config
    sed -i "154s/Indexes//" /etc/apache2/apache2.conf && \
    sed -i "165s/Indexes//" /etc/apache2/apache2.conf && \
    /etc/init.d/apache2 start && \
    # mysql
    rm -rf /var/lib/mysql && \
    mysql_install_db --user=mysql --datadir=/var/lib/mysql && \
    sh -c 'mysqld_safe &' && \
    sleep 5s  && \
    mysqladmin -uroot password 'b84f73327300021c961c2ce1f9d0dcdc' && \
    # supervisor
    mkdir -p /var/log/supervisor && \
    mv /var/www/html/supervisord.conf /etc/ && \
    #
    chown -R root:root /var/www/html/ && \
    chmod -R 777 /var/www/html/ && \
    chmod -R +t /var/www/html/ && \
    rm /var/www/html/index.html && \
    mv /var/www/html/start.sh / && \
    chmod +x /start.sh

EXPOSE 80

ENTRYPOINT ["/start.sh"]
