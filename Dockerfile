#
# Thruk Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

LABEL org.opencontainers.image.authors="hihouhou < hihouhou@hihouhou.com >"


# Update & install packages for thruk
RUN echo 'deb http://labs.consol.de/repo/stable/debian jessie main' >> /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y --force-yes thruk

#Configure thruk
ADD thruk_local.conf /etc/thruk/
ADD cgi.cfg /etc/thruk/

EXPOSE 80

CMD ["apache2ctl", "-D", "FOREGROUND"]
