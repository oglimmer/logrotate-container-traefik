# logrotate for traefik running inside a container 

* Logrotate will run once a day
* Logrotate will look for a log file specified via the environment variable LOGPATH
* After rotating the log file logrotate will send a SIG USR1 to the container with the name giving my the environment variable IMAGENAME

Example docker-compose usage:

```yml
  logrotate:
     image: oglimmer/logrotate-container-traefik
     restart: always
     environment:
       - IMAGENAME=traefik
       - LOGPATH=/var/log/access.json
     volumes:
       - "/var/run/docker.sock:/var/run/docker.sock"
       - "/opt/access-logs:/var/log"
```
