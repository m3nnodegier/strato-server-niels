# syntax=docker/dockerfile:1
# You need Docker BuildKit enabled to build this Dockerfile.

# Define Alpine and NGINX versions to use.
ARG ALPINE_VERSION=3.17.3
ARG NGINX_VERSION=1.23.4

# Prepare an Alpine-based image with OpenSSL.
FROM alpine:${ALPINE_VERSION} as alpine
ARG DOMAIN_NAME=localhost
ARG COUNTRY=NL
ARG STATE=UT
ARG CITY=WOERDEN
ARG COMPANY='NIELS and Lamar super company'
ARG ORGANISATION=Drake
ARG DAYS_VALID=90

RUN apk add --no-cache openssl
RUN echo "Creating self-signed certificate valid for ${DAYS_VALID} days for domain ${DOMAIN_NAME}" && \
    openssl \
    req -x509 \
    -nodes \
    -subj "/C=${COUNTRY}/ST=${STATE}/L=${CITY}/O=${COMPANY}/OU=${ORGANISATION}/CN=${DOMAIN_NAME}" \
    -addext "subjectAltName=DNS:${DOMAIN_NAME}" \
    -days ${DAYS_VALID} \
    -newkey rsa:2048 -keyout /tmp/self-signed.key \
    -out /tmp/self-signed.crt

# Prepare an NGINX-based image with the certificate created above.
FROM nginx:${NGINX_VERSION} as nginx

COPY --from=alpine /tmp/self-signed.key /etc/ssl/private

COPY --from=alpine /tmp/self-signed.crt /etc/ssl/certs

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

