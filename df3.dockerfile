FROM nginx:latest
WORKDIR /usr/share/nginx/html
ENV etc /etc/nginx/conf.d/
ENV email a.katruk@live.com
ENV ssl bookstore.marina.katruk.ru
RUN \
    apt update && \
    apt install letsencrypt -y
RUN \
    letsencrypt certonly --webroot -m $email -w . -d ssl
COPY default.conf $etc
COPY index.html .
USER root
EXPOSE 80
ENTRYPOINT [ "executable" ] ["nginx", "-g", "daemon off;"]