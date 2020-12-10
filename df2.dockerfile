FROM node:latest
WORKDIR /opt/www/
RUN mkdir -p /opt/www/
RUN git clone https://github.com/marinakatruk/bookstore.git . && \
    chown -R node:node .
USER node
RUN npm install --verbose
EXPOSE 8080
CMD [ "npm", "start" ]

