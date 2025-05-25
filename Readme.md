# private burp collaborator server in docker

This setup provides a dockerized burp collaborator server based on the latest version of burp. The image is rebuilt daily so it always contains the latest java and burp versions.

## Setup

Create a config file according to [the docs](https://portswigger.net/burp/documentation/collaborator/server/private) in `./config/collaborator.config`. Be sure to remove all `localAddress` properties and place all needed certificates in the same folder. To reference them in the config you need to use the path `/config/...` as the whole config folder is mounted to `/config`.
It's also recommended to set some java options using the `JAVA_OPTIONS` environment variable based on your system setup. See here for some [common examples](https://portswigger.net/burp/documentation/collaborator/server/private#setting-up-your-server-resources).

Finally run the docker image (and adopt to your needs)

```
docker run -d --restart unless-stopped --name burp-collaborator -e JAVA_OPTONS="-Xmx12g -Xms12g -XX:+UseG1GC" -p 53:53/udp -p 80:80/tcp -p 443:443/tcp -p 25:25/tcp -p 587:587/tcp -p 465:465/tcp -v ./config:/config/:ro firefart/burp-collaborator:latest
```
