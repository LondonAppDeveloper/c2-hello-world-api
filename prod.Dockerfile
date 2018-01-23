FROM base.Dockerfile

ENV PYTHONUNBUFFERED 1
RUN apk add --update --no-cache gcc libc-dev linux-headers
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
RUN mkdir /app
WORKDIR /app
COPY hello_world_api/ /app/
ENV PATH="/app:${PATH}"

RUN adduser -D user
USER user
CMD ["uwsgi", "--http", ":8000", "--plugin", "python", "--workers", "4", "--chdir", "/app", "-w", "hello_world_api.wsgi"]
