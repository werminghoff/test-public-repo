FROM nginx:1.29.0

ARG TARGETARCH

COPY built-${TARGETARCH}/myapp /bin/myapp

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html.${TARGETARCH} /usr/share/nginx/html/index.html
CMD [ "/entrypoint.sh" ]
ENTRYPOINT ["/entrypoint.sh"]