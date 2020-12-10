FROM centos:latest
ARG NG_VERSION
ARG ARG_FILE
ENV NG_VERSION="$NG_VERSION"
ENV DIR="$/etc/nginx"
ADD https://nginx.org/packages/centos/7/x86_64/RPMS/nginx-$NG_VERSION-2.el7.ngx.x86_64.rpm .
RUN echo ttt > /opt/$ARG_FILE && \
   yum -y update && \
   yum install curl && \
   yum -y install curl nginx-$NG_VERSION-2.el7.ngx.x86_64.rpm
COPY default.conf $DIR/conf.d/
COPY nginx.conf $DIR
ENTRYPOINT ["nginx", "-g", "daemon off;"]
