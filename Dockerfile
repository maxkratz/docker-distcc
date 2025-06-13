FROM debian:bullseye
LABEL maintainer="Max Kratz <github@maxkratz.com>"
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -q && \
    apt-get upgrade -yq

RUN apt-get install -y --no-install-recommends --no-install-suggests g++ clang distcc
RUN apt-get clean  -y

# Remove apt lists (for storage efficiency)
RUN rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh

EXPOSE 3632
ENTRYPOINT ["/entrypoint.sh"]
