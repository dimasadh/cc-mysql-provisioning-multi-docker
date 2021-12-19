FROM python:3.8-alpine

RUN apk update && apk add --no-cache bash py3-virtualenv
RUN mkdir /apps
ADD container_model.py /apps
ADD requirements.txt /apps
ADD Service.py /apps
RUN rm -rf /tmp/* /var/cache/apk/*
ADD dbports.db.bak /apps
ADD dbports.db.dat /apps
ADD dbports.db.dir /apps
ADD users.db.bak /apps
ADD users.db.dat /apps
ADD users.db.dir /apps
ADD /certs/ca-key.pem /apps
ADD /certs/ca.pem /apps
ADD /certs/cert.pem /apps
ADD /certs/key.pem /apps
WORKDIR /apps
EXPOSE 32111
RUN cd /apps && pip3 install -r requirements.txt
ENTRYPOINT ["python3","Service.py"]