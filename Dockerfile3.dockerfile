FROM node:latest
RUN apt update && \
    apt-get --yes install nginx && \
    mkdir -p /opt/www/
WORKDIR /opt/www/
ADD https://github.com/marinakatruk/bookstore/archive/master.zip .
RUN ls -la 
RUN unzip /opt/www/master.zip 
RUN ls -la 
RUN chown -R node:node .
# RUN chown -R node:node /usr/local/lib/node_modules/
COPY . .
RUN ls -la bookstore-master/
USER node
RUN npm install
# WORKDIR /opt/www/bookstore-master/
CMD [ "node", "app.js" ]
COPY default.conf /etc/nginx/conf.d/
USER root
RUN ls -la 
RUN ls -la bookstore-master/
EXPOSE 80
ENTRYPOINT [ "executable" ] ["nginx", "-g", "daemon off;"]
