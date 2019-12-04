#!/bin/bash

sh -c 'mysqld_safe &'
mysql_ready() {
	mysqladmin ping --host=127.0.0.1 --user=root --password=root > /dev/null 2>&1
}

while !(mysql_ready)
do
	echo "waiting for mysql ..."
	sleep 3
done
sed -i "s/flag_here/$FLAG/" /var/www/html/web.sql
mysql -e "source /var/www/html/web.sql;" -uroot -pb84f73327300021c961c2ce1f9d0dcdc
rm /var/www/html/web.sql
export FLAG=not_flag
FLAG=not_flag
killall mysqld_safe

supervisord -n
tail -F /dev/null
