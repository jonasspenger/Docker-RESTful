FROM alpine:3.7

EXPOSE 8080

RUN apk add uwsgi uwsgi-python3 uwsgi-http python3

WORKDIR /app
COPY . /app

RUN pip3 install --trusted-host pypi.python.org -r app/requirements.txt

CMD ["uwsgi",\
    "--plugins", "http",\
    "--plugins", "python3",\
    "--http", "0.0.0.0:8080",\
    "--wsgi-file", "app/app.py",\
    "--master",\
    "--processes", "4",\
    "--threads", "1"]
