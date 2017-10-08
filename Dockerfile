FROM debian:jessie
MAINTAINER Andrey Andreev <andyceo@yandex.ru> (@andyceo)
LABEL zcash_version="1.0.12"
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install -y --no-install-recommends \
    apt-transport-https \
    ca-certificates \
    cron \
    supervisor \
    wget && \
  wget -qO - https://apt.z.cash/zcash.asc | apt-key add - && \
  echo "deb https://apt.z.cash/ jessie main" | tee /etc/apt/sources.list.d/zcash.list && \
  apt-get update && \
  apt-get install -y --no-install-recommends zcash && \
  apt-get purge -y apt-transport-https wget && \
  apt-get autoclean && \
  mkdir -p /root/.zcash-params /root/.zcash
COPY etc /etc
COPY root /root
VOLUME ["/root/.zcash-params", "/root/.zcash", "/etc/cron.d/"]
ENTRYPOINT ["/usr/bin/supervisord"]
