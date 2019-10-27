FROM centos:7.4.1708
RUN yum -y update
RUN yum install -y vim \
    git \
    wget \
    curl \
    epel-release
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm \
    && rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm

RUN yum install -y net-tools \
    nginx \
    unzip \
    htop \
    lrzsz
RUN yum install -y mod_php71w php71w-opcache php71w-bcmath php71w-common php71w-fpm php71w-devel php71w-cli php71w-gd php71w-mbstring php71w-mcrypt php71w-mysqlnd php71w-odbc php71w-pdo php71w-pecl-imagick php71w-pecl-memcached php71w-pecl-mongodb php71w-pecl-redis php71w-snmp php71w-xml php71w-imap
RUN adduser www
COPY ./bin/composer /usr/local/bin/composer
COPY ./package/ /usr/lib64/php/modules/
COPY ./ini/ /etc/php.d/
COPY ./lib/ /usr/local/lib/
COPY ./lib64/ /lib64/
COPY ./swoole /usr/include/php/ext/swoole
COPY ./nginx /etc/nginx
COPY ./app-entrypoint.sh /usr/local/bin/
COPY ./installThrift.sh /usr/local/src/

RUN yum install -y libevent-devel  nghttp2

WORKDIR /home/www/app
EXPOSE 80 3000 8000
CMD ["nginx","-g","daemon off;"]