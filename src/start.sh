#!/bin/bash

sh -c 'mysqld_safe &'
sleep 5s
sed -i "s/flag_here/$FLAG/" /var/www/html/web.sql
mysql -e "source /var/www/html/web.sql;" -uroot -pb84f73327300021c961c2ce1f9d0dcdc
rm /var/www/html/web.sql
export FLAG=not_flag
FLAG=not_flag
killall mysqld_safe

supervisord -n
tail -F /dev/null
