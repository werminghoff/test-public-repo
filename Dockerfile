FROM nginx:1.29.0

ARG TARGETARCH

COPY index.html.${TARGETARCH} /usr/share/nginx/html/index.html