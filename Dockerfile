FROM python:3.9-alpine3.13
LABEL maintainer="stubbs"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

ARG DEV=false
RUN pip install -r /tmp/requirements.txt
RUN adduser --disabled-password --no-create-home django-user
RUN if [ $DEV = "true" ]; then pip install -r /tmp/requirements.dev.txt ; fi
RUN rm -rf /tmp
USER django-user