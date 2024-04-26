# Microservice 

* Client: 3000
* Server: 3005

## Local dev

```bash
docker compose up
```

## Clean up docker-in-docker

```
docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
```