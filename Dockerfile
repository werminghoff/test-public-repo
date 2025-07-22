# syntax=docker/dockerfile:1
FROM rust:1.88 AS build
WORKDIR /src
COPY myapp /src/myapp
RUN cd /src/myapp && cargo build --release

FROM nginx:1.29.0

ARG TARGETARCH

COPY --from=build /src/myapp/target/release/myapp /bin/myapp

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html.${TARGETARCH} /usr/share/nginx/html/index.html
CMD [ "/entrypoint.sh" ]
ENTRYPOINT ["/entrypoint.sh"]