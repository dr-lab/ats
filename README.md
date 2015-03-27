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
  ```docker exec -it ats /opt/ats/bin/trafficserver start``` <br>
  In container: <br>
    ```docker run -ti -p 17070:8080 --name ats guhuaping/ats  /bin/bash```


##Configuration
* if you are not in container session, attach to container first
  ```docker attach ats```
* finish your configurations
  ```cd /opt/ats/etc/trafficserver/```
* update settings
  ```/opt/ats/bin/traffic_line -x```

##Verification
* Check port mapping is correct, the hit ATS HTTP  
  ```docker port ats``` 
  <br>
        8080/tcp -> 0.0.0.0:17070 
  <br><br>
        ```http://host_ip:17070```
  <br>
  If use all default settings, you will see "Not Found on Accelerator" error message. That means ATS started, but configuration is not finished, check records.config, remap.config and others. 
* use ```traffic_top, traffic_logstats and traffic_logcat```, check status and logs.


##Note
This is for ATS test only, do not use in Production. <br>
If user want to mount host directory by ```-v /SHARED_ATS_CONFIG/:/opt/at/etc/trafficserver```, make sure in records.config the port = 8080<br>
```proxy.config.http.server_ports 8080``` 

