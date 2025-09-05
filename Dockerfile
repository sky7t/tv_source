FROM php:8.2-cli-alpine

RUN apk add --no-cache git unzip curl bash

RUN mkdir vox

COPY entrypoint.sh /vox/entrypoint.sh

RUN chmod +x /vox/entrypoint.sh

EXPOSE 5301 5302 5303

ENTRYPOINT ["/vox/entrypoint.sh"]
