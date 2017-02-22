#!/bin/bash
if [ $(id -u) != "0" ]; then
	echo "Error: You must be root to run this script, please use root to install nginx!"
	echo " or use sudo command!!"
	exit 1
fi

cat > /etc/apt/sources.list<<EOF
deb http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty-security main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty-updates main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty-proposed main restricted universe multiverse
deb-src http://mirrors.163.com/ubuntu/ trusty-backports main restricted universe multiverse
EOF

apt-get -y update
apt-get -y install gcc g++ openssl libssl-dev make wget
sleep 2
# check file
if [ ! -f pcre-8.39.tar.gz ]; then
	echo "File pcre-8.39.tar.gz does not exist! "
	echo "Begin download pcre-8.39.tar.gz"
	wget -c ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/pcre-8.39.tar.gz
fi
if [ ! -f nginx-1.10.1.tar.gz ]; then
	echo "File nginx-1.10.1.tar.gz does not exist! "
	echo "Begin download nginx-1.10.1.tar.gz"
	wget -c http://nginx.org/download/nginx-1.10.1.tar.gz
fi
#if [ ! -f ngx-fancyindex.tar.gz ]; then
#	echo "ngx-fancyindex does not exist! "
#	echo "Begin download ngx-fancyindex "
#fi	
tar -zxvf pcre-8.39.tar.gz -C /usr/local/src
tar -zxvf nginx-1.10.1.tar.gz -C /usr/local/src
tar -zxvf ngx-fancyindex.tar.gz -C /usr/local/src
cd /usr/local/src/nginx-1.10.1
useradd -M -s /sbin/nologin nginx
./configure --user=nginx --group=nginx --prefix=/usr/local/nginx --with-http_stub_status_module --with-http_ssl_module --with-http_gzip_static_module --with-http_sub_module --with-pcre=/usr/local/src/pcre-8.39 --add-module=/usr/local/src/ngx-fancyindex
make
make install
sleep 1
rm -f /usr/local/nginx/conf/nginx.conf
cd /root
cp nginx.conf fastcgi.conf /usr/local/nginx/conf
rm -rf /usr/local/src/*
apt-get -y clean
apt-get -y autoclean
rm -f pcre-8.39.tar.gz nginx-1.10.1.tar.gz ngx-fancyindex.tar.gz
#/usr/local/nginx/sbin/nginx -t -c /usr/local/nginx/conf/nginx.conf
