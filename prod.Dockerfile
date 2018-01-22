FROM python:3.6-alpine

ENV PYTHONUNBUFFERED 1
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt
RUN mkdir /app
WORKDIR /app
COPY hello_world_api/ /app/
ENV PATH="/app:${PATH}"

CMD ["uwsgi", "--http", ":8000", "--home", "/app", "--chdir", "/app", "-w", "hello_world_api.wsgi"] 
