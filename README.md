##执行顺序
* 安装数据库
><code>docker pull mariadb:10.2</code>

><code>docker run \\
--name db \\
-p 3306:3306 \\
-e MYSQL_ROOT_PASSWORD='Clsupermans*&^%' \\
-d mariadb:10.2</code>
* 执行dockerfile build
><code>docker build -t dev:2.0 . </code>
* 运行容器, 绑定数据库
><code>docker run -d --name dev --link db -p 3000:3000 -p 27017:27017 -p 28017:28017 -p 80:80 -p 6379:6379 --privileged=true -v /f/workflow:/data/www/ dev:2.0 /usr/sbin/init
</code>
* 进入容器
><code>docker exec -it dev bash </code>
* 执行命令初始化容器
    - 安装swoole的一个依赖
    - 设置多个服务为自启动
    - 启动服务
    - 安装thrift
><code>yum install -y nghttp2 && \\
systemctl enable php-fpm nginx redis mongod supervisord && \\
systemctl start php-fpm nginx redis mongod supervisord && \\
/usr/local/src/installThrift.sh
</code>