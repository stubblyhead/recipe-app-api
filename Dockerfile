FROM python:3.9-apline3.13
LABEL maintainer="stubbs"

ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY ./app /app
WORKDIR /app
EXPOSE 8000

RUN pip install -r /tmp/requirements.txt && rm -rf /tmp
RUN adduser --disabled-password --no-create-home django-user

USER django-user