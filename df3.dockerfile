FROM nginx:latest
WORKDIR /usr/share/nginx/html
ENV etc /etc/nginx/conf.d/
ENV ssl bookstore.marina.katruk.ru
RUN \
    apt update && \
    apt install letsencrypt -y
RUN \
    letsencrypt certonly --webroot -w . -d $ssl
COPY default.conf $etc
COPY index.html .
USER root
EXPOSE 80
ENTRYPOINT [ "executable" ] ["nginx", "-g", "daemon off;"]