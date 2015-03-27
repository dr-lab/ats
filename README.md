# Apache Traffic Server on Ubuntu
* ATS Ver: 5.2.0
* Ubuntu: 14.04
* ATS Installation path: /opt/ats
* Exposed port: 8080


##Installation
* Install docker on your host OS
https://docs.docker.com/
* Start ATS<br>
  On host OS: <br>
    ``` docker exec -it ats /opt/ats/bin/trafficserver start``` <br>
  In container: <br>
    ```docker run -ti -p 17070:8080 --name ats guhuaping/ats  /bin/bash```


##Configuration
* if you are not in container session, attach to container first
  ```docker attach ats```
* finish your configurations
  ```cd /opt/ats/etc/trafficserver/```
* update settings
  ```/opt/ats/bin/traffic_line -x```

##Note
This is for ATS test only, do not use in Production.


