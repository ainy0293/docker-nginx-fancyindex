FROM ubuntu:14.04
MAINTAINER Ainy Min <Email: ainy@ifool.me> <Website: http://ifool.me>
ENV REFRESHED_AT 2017-02-13
ENV PATH $PATH:/usr/local/nginx/sbin

ADD include/ /root
WORKDIR /root/
RUN ./nginx.sh

VOLUME ["/usr/local/nginx/html", "/usr/local/nginx/logs", "/usr/local/nginx/conf"]
CMD ["nginx"]

EXPOSE 80 443
