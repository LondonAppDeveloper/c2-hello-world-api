FROM python:3.6-alpine

ENV PYTHONUNBUFFERED 1
COPY ./requirements.txt /requirements.txt
RUN apk add --update --no-cache --virtual .build-deps \
      gcc libc-dev linux-headers && \
    pip install -r /requirements.txt && \
    apk del .build-deps
RUN mkdir /app
WORKDIR /app
COPY ./app/ /app
ENV PATH="/app:${PATH}"

RUN adduser -D user
USER user
CMD ["uwsgi", "--http", ":8000", "--plugin", "python", "--workers", "4", "--chdir", "/app", "-w", "app.wsgi"]
