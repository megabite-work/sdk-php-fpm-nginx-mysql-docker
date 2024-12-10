1. Clone this repository ```git clone github.com/megabite-work/sdk-php-fpm-nginx-mysql-docker.git example-project```
2. ```cd example-project```
3. ```mkdir project```
4. ```make dc_build dc_up php_bash```
5. Create via composer php application.
   ```composer create-project laravel/laravel .``` or
   ```composer create-project symfony/skeleton .```
6. Done! You can open <a href="http://localhost:8888" target="_blank">http://localhost:8888</a> via browser. 
By the way, you can change this port by changing ```NGINX_HOST_HTTP_PORT``` variable in [docker/.env](docker/.env) file.
