FROM nginx:1.29.0
COPY index.html /usr/share/nginx/html/index.html

ARG TARGETARCH

RUN echo "should be copying mybin.${TARGETARCH}"