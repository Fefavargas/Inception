FROM debian:latest

RUN apt update && apt install -y nginx

# COPY conf/test.conf .

CMD ["nginx", "-g", "daemon off;"]
