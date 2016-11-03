FROM debian:latest

MAINTAINER Andrey Andreev <andyceo@yandex.ru> (@andyceo)

RUN apt-get install apt-transport-https && \
  wget -qO - https://apt.z.cash/zcash.asc | apt-key add - && \
  echo "deb https://apt.z.cash/ jessie main" | tee /etc/apt/sources.list.d/zcash.list && \
  apt-get update && \
  apt-get install zcash && \
  apt-get purge apt-transport-https && \
  apt-get autoclean && \
  mkdir -p /root/.zcash-params /root/.zcash

COPY zcash.conf /root/.zcash

VOLUME ["/root/.zcash-params", "/root/.zcash"]

ENTRYPOINT ["/usr/bin/zcashd"]
