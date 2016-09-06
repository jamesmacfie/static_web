FROM ubuntu:16.04
MAINTAINER James Macfie "james@macfie.co.nz"
RUN apt-get update && apt-get install -y nginx && apt-get install -y curl
RUN echo 'Hello world' >/var/www/html/index.html
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=1m --retries=5 CMD curl http://localhost || exit 1
ENTRYPOINT ["nginx", "-g", "daemon off;"]
