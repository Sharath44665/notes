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




