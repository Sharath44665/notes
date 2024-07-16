# Nginx Handbook

### check status of nginx:

ofcourse, first you need to install nginx
``` shell
sudo systemctl status nginx.service
```

`nginx.conf` file exist in `/etc/nginx`

rename the existing `nginx.conf` file as `nginx.conf.backup`

```
sudo mv nginx.conf nginx.conf.backup

sudo touch nginx.conf
```

```
events {}

http {

        server {
                listen 80;
                server_name nginx-helloworld.test;

                return 200 "hello world from sharath";
        }
}
```

test nginx:

``` shell
sudo nginx -t
```

reload nginx:

``` shell
sudo nginx -s reload 
```

in the browser do this:

![output](./img/Pictures/2024-07-14_15-17.png)

terminal Output:

![terminalOutput](./img/terminalOuput2024-07-14_15-22.png)

### Listen in different ports:

```
events {}

http {

        server {
                listen 80;
                server_name nginx-helloworld.test;

                return 200 "hello world from sharath from port 80";
        }

        server {
                listen 8080;
                server_name nginx-helloworld.test;

                return 200 "hello world from port 8080";
        }
}
```

output:

![listen in different port](./img/listenDifferentPorts2024-07-14_15-31.png)


### Serve static content using Nginx:

```
events {}

http {

        server {
                listen 80;
                server_name nginx-helloworld.test;

                root /var/www/html/static-demo;
        }
}
```

test and reload the nginx 

see the web page:

![static content](./img/staticContent2024-07-14_15-44.png)

from the above pic, there may be problem in css, but in reality its the problem of configuration file

debugging:

![cssConfigProblem](./img/cssConfiiguration2024-07-14_15-50.png)

#### load the mime:

```
events {}

http {
        include /etc/nginx/mime.types;


        server {
                listen 80;
                server_name nginx-helloworld.test;

                root /var/www/html/static-demo;
        }
}
```

see the difference

![include mimes](./img/loadMimes2024-07-14_16-03.png)

![diff](./img/diff2024-07-14_16-07.png)

### Routing in Nginx

nginx.conf:

```
events {}

http {


        server {
                listen 80;
                server_name nginx-helloworld.test;

                location /sharath {
                        return 200 "routing from location sharath\n";
                }

        }
}

```

![fromLocation](./img/location2024-07-14_16-39.png)

from the above screenshot if you do `curl -i http://localhost/sharathchandra`, you still get the same response as above

#### To perform exact match

```
events {}

http {


        server {
                listen 80;
                server_name nginx-helloworld.test;

                location = /sharath {
                        return 200 "routing from location sharath\n";
                }

        }
}
```

test and reload nginx, run the previous code to see the difference

#### regx Match

```
events {}

http {


        server {
                listen 80;
                server_name nginx-helloworld.test;

                location = /sharath {
                        return 200 "routing from location sharath\n";
                }

                location ~ /page[0-9] {
                        return 200 "returning from page()s\n";
                }

        }
}

```

![regxMatch](./img/regxMatch2024-07-14_16-56.png)

**case insensitive:**

![case sensitive](./img/caseSensitive2024-07-14_17-03.png)

to make case insensitive, do this:

```
events {}

http {


        server {
                listen 80;
                server_name nginx-helloworld.test;

                location = /sharath {
                        return 200 "routing from location sharath\n";
                }

                location ~* /page[0-9] {
                        return 200 "returning from page()s\n";
                }

        }
}

```

![case insensitive](./img/case2024-07-14_17-07.png)


**lets check priority:**

```
events {}

http {


        server {
                listen 80;
                server_name nginx-helloworld.test;

                location = /sharath {
                        return 200 "routing from location sharath\n";
                }

                location /Page2 {
                        return 200 "Page 2 found - no pattern matching\n";
                }

                location ~* /page[0-9] {
                        return 200 "Page 2 found - pattern matching\n";
                }

        }
}

```

![priorityCheck](./img/priority2024-07-14_17-54.png)

**Above priority can be changed a little:**

using `^~` , we can make the priority which is our preferential

```
events {}

http {


        server {
                listen 80;
                server_name nginx-helloworld.test;

                location = /sharath {
                        return 200 "routing from location sharath\n";
                }

                location ^~ /Page2 {
                        return 200 "Page 2 found - priority changed by me\n";
                }

                location ~* /page[0-9] {
                        return 200 "Page 2 found - pattern matching\n";
                }

        }
}

```

Priority can be listed as follows first row being highest priority, second row less priority as compared to first row and moving on

![priority change](./img/prirorityChange2024-07-14_18-03.png)

<table>
<tr>
<th>
Match
</th>
<th>
Modifier
</th>
</tr>
<tr>
<td>
Exact
</td>
<td>

`=`
</td>
</tr>
<tr>
<td>
Preferential Prefix 
</td>
<td>

`^~`
</td>
</tr>
<tr>
<td>
regx
</td>
<td>

`~` or `~*`
</td>
</tr>
<tr>
<td>
Prefix Match
</td>
<td>
None
</td>
</tr>
</table>

### Passing Arguments:

```
events {}

http {


        server {
                listen 80;
                server_name nginx-helloworld.test;

                return 200 "Host: $host\nURI: $uri\nArgs: $args\n";
        }
}
```

![args](./img/args2024-07-14_18-27.png)

from above, Instead of printing the literal string form of the query strings, you can access the individual values using the `$arg` variable.

```
events {}

http {


        server {
                listen 80;
                server_name nginx-helloworld.test;

                set $name $arg_name;

                return 200 "Host: $host\nURI: $uri\nName: $name\nArgs: $args\n";
        }
}
```

![printing name:](./img/name2024-07-14_18-35.png)

### Redirects and rewrites

redirecting

```
events {}

http {
        include /etc/nginx/mime.types;

        server {
                listen 80;
                server_name nginx-helloworld.test;

                root /var/www/html/static-demo;

                location = /indexPage {
                        return 307 /index.html;
                }

                location = /aboutPage {
                        return 307 /about.html;
                }

        }
}
```

![redirect](./img/redirect2024-07-14_18-47.png)

rewriting:

```
events {}

http {
        include /etc/nginx/mime.types;

        server {
                listen 80;
                server_name nginx-helloworld.test;

                root /var/www/html/static-demo;

                rewrite /indexPage /index.html;
                rewrite /aboutPage /about.html;
        }
}
```

![rewrite demo](./img/rewriteDemo2024-07-14_18-54.png)

### try_files directive:

```
events {}

http {
        include /etc/nginx/mime.types;

        server {
                listen 80;
                server_name nginx-helloworld.test;

                root /var/www/html/static-demo;

                try_files /the-nginx-handbook.jpg /notFound;

                location /notFound {
                        return 404 "the file was not found";
                }
        }
}
```

test, reload and go to `http://localhost/` 

=> 

![try](./img/try2024-07-15_14-46.png)

Now the problem with writing a `try_files` directive this way is that no matter what URL you visit, as long as a request is received by the server and the the-nginx-handbook.jpg file is found on the disk, NGINX will send that back.Now the problem with writing a `try_files` directive this way is that no matter what URL you visit, as long as a request is received by the server and the the-nginx-handbook.jpg file is found on the disk, NGINX will send that back.

meaning of above line, if you do `http://localhost/dummy.png`, you still get the same response as you see in the above pic

we can avoid the above bug by doing this:

```
events {}

http {
        include /etc/nginx/mime.types;

        server {
                listen 80;
                server_name nginx-helloworld.test;

                root /var/www/html/static-demo;

                try_files $uri  /notFound;

                location /notFound {
                        return 404 "the file was not found";
                }
        }
}
```
test and reload the nginx for above code

now if you do `http://localhost/dummy.png` you get the error: "the file was not found"

### Loggin in nginx

cd `/var/log/nginx`

rm log files:
> sudo rm error.log access.log

create new files:
``` shell
sudo touch error.log access.log
```

reopen nginx

``` shell
sudo nginx -s reopen
```

do this **to get access logs**: 

`curl -i http://localhost/index.html` , which should give `HTTP/1.1 200 OK` 

![accessLog](./img/accessLogs2024-07-15_15-25.png)

 we can change this behavior using the `access_log` directive:

```
events {}

http {
        include /etc/nginx/mime.types;

        server {
                listen 80;
                server_name nginx-helloworld.test;

                root /var/www/html/static-demo;

                location / {
                        return 200 "Hello World from home";
                }

                location = /admin {
                        access_log /var/log/nginx/admin.log;

                        return 200 "this will be logged to seperate file";
                }

                location = /noLogging {
                        access_log off;

                        return 200 "there will be no logging";
                }
        }
}
```
test and reload nginx

![demo](./img/accessLogDemo2024-07-15_15-46.png)

#### to get logs in `/var/logs/nginx/error.log`, we need to do crash the nginx servers or do some mistakes in nginx.conf and check the `/var/logs/nginx/error.log`

There are eight levels of error messages:

`debug` – Useful debugging information to help determine where the problem lies.
    
`info` – Informational messages that aren't necessary to read but may be good to know.
   
`notice` – Something normal happened that is worth noting.
    
`warn` – Something unexpected happened, however is not a cause for concern.
    
`error` – Something was unsuccessful.
    
`crit` – There are problems that need to be critically addressed.
    
`alert` – Prompt action is required.
    
`emerg` – The system is in an unusable state and requires immediate attention.

---

### Use NGINX as a Reverse Proxy

```
events {}

http {
        include /etc/nginx/mime.types;

        server {
                listen 80;
                server_name nginx-helloworld.test;

                location / {
                        proxy_pass "http://nginx.org/";
                }
        }
}
```

modify the hosts file:

![host file modify](./img/hostsFileChange2024-07-15_16-13.png)

result:

![result](./img/endGoal2024-07-15_16-15.png)

### node js with nginx - proxy

move project `node-js-demo` to `/var/www/html/node-js-demo`

> install nodejs, npm 

after installation run this command: `sudo npm install -g pm2`

inside directory `/var/www/html/node-js-demo` , run this command:

``` shell
pm2 start app.js
```   

![nodejsApp](./img/nodeJsOutput2024-07-15_18-31.png)

**nginx as a reverse proxy:**

```
events {}

http {
        include /etc/nginx/mime.types;

        server {
                listen 80;
                server_name nginx-helloworld.test;

                location / {
                        proxy_pass http://localhost:3000;
                }
        }
}
```

![helloworld](./img/nodejsNginx2024-07-15_18-52.png)

For example, if your application handles web socket connections, then you should update the configuration as follows:

```
events {

}
  
http {
    listen 80;
    server_name nginx-handbook.test

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
    }
}
```
### PHP With NGINX

move `php-demo` to `/var/www/html/`

``` shell
sudo apt install php-fpm -y
```

``` shell
cd /var/www/html/

php -S localhost:8000
```

![php server](./img/phpServer2024-07-15_19-54.png)

```
events {}

http {
        include /etc/nginx/mime.types;

        server {
                listen 80;
                server_name nginx-helloworld.test;
                root /var/www/html/php-demo;

                index index.php;

                location / {
                        try_files $uri $uri/ =404;

                }

                location ~ \.php$ {
                        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
                        fastcgi_param REQUEST_METHOD $request_method;
                        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
                }
        }
}

```
- by writing `index index.php`, you're instructing NGINX to use the index.php file as root
- If you write something like `index index.php index.html`, NGINX will first look for index.php. If it doesn't find that file, it will look for an indeiiix.html file.
- The `try_files` directive inside the first location context is the same as you've seen in a previous section. The `=404` at the end indicates the error to throw if none of the files are found.

well nginx is crashed:

![nginx crash](./img/nginxOutputPhp2024-07-15_20-13.png)

``` shell
tail -n 1 /var/log/nginx/error.log

ps aux | grep nginx
```

![owned by nobody](./img/ownedByNobody2024-07-15_20-24.png)

As you can see, the process is currently owned by nobody. Now inspect the PHP-FPM process.

``` shell
ps aux | grep php
```

![another user](./img/anotherUser2024-07-15_20-27.png)

owned by the `www-data` user. This is why NGINX is being denied access to this process.

#### To solve this issue, update your configuration as follows:

The `user` directive is responsible for setting the owner for the NGINX worker processes

```
user www-data;

events {}

http {
        include /etc/nginx/mime.types;

        server {
                listen 80;
                server_name nginx-helloworld.test;
                root /var/www/html/php-demo;

                index index.php;

                location / {
                        try_files $uri $uri/ =404;

                }

                location ~ \.php$ {
                        fastcgi_pass unix:/var/run/php/php8.1-fpm.sock;
                        fastcgi_param REQUEST_METHOD $request_method;
                        fastcgi_param SCRIPT_FILENAME $realpath_root$fastcgi_script_name;
                }
        }
}
```

``` shell
ps aux | grep nginx
```

![success](./img/successPhp2024-07-15_20-43.png)

---

## Use NGINX as a Load Balancer

move `load-balancer-demo` to `/var/www/html/`

``` shell
cd /var/www/html/load-balancer-demo

pm2 start server-1.js 
pm2 start server-2.js 
pm2 start server-3.js 
```
![start servers](./img/serverStart2024-07-15_20-52.png)

``` shell
pm2 list
```

check `http://localhost:3001/`, `http://localhost:3002/`, `http://localhost:3003/`

Now update config

```
events {}

http {
        include /etc/nginx/mime.types;

        upstream backend_servers {
                server localhost:3001;
                server localhost:3002;
                server localhost:3003;
        }

        server {
                listen 80;
                server_name nginx-helloworld.test;

                location / {
                        proxy_pass http://backend_servers;
                }

        }
}
```

do in bash:
``` shell
while sleep 0.5; do curl http://nginx-handbook.test; done
```

![loadBalancer](./img/loadBalancerDemoOne2024-07-15_21-15.png)

As you can see from the responses from the server, NGINX is load balancing the servers automatically.

`pm2 stop server-1 server-2 server-3`


### How to Optimize NGINX for Maximum Performance

#### How to Configure Worker Processes and Worker Connections

``` shell
sudo systemctl status nginx.service
```
As you can see, right now there is only one NGINX worker process on the system. This number, however, can be changed by making a small change to the configuration file.

following code will create two nginx service

```
worker_processes 2;

events {

}

http {

    server {

        listen 80;
        server_name nginx-handbook.test;

        return 200 "worker processes and worker connections configuration!\n";
    }
}
```
> now chech the nginx.service status, we have two worker process

following code will get back to 1 worker service:

```
worker_processes auto;

events {

}

http {

    server {

        listen 80;
        server_name nginx-handbook.test;

        return 200 "worker processes and worker connections configuration!\n";
    }
}
```

### Compress Responses

```
worker_processes auto;

events {
    worker_connections 1024;
}

http {
    include /env/nginx/mime.types;

    gzip on;
    gzip_comp_level 3;

    gzip_types text/css text/javascript;

    server {

        listen 80;
        server_name nginx-handbook.test;

        root /srv/nginx-handbook-demo/static-demo;
        
        location ~* \.(css|js|jpg)$ {
            access_log off;
            
            add_header Cache-Control public;
            add_header Pragma public;
            add_header Vary Accept-Encoding;
            expires 1M;
        }
    }
}
```

``` shell
curl -I -H "Accept-Encoding: gzip" http://nginx-helloworld.test/mini.min.css
```

 from the output: `Content-Encoding` is now set to `gzip` meaning this is the compressed version of the file.



