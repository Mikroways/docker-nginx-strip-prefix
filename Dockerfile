FROM nginxinc/nginx-unprivileged:1.23-alpine as nginx
USER root
RUN mkdir -p /app && chown nginx:nginx /app
ENV UPSTREAM_PROTOCOL=http \
    UPSTREAM_SERVER=localhost \
    UPSTREAM_PORT=8080
COPY nginx.conf.template /etc/nginx/templates/default.conf.template
RUN echo "ok" > /app/_healthcheck
USER nginx
EXPOSE 7070
