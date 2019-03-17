FROM ubuntu

RUN apt-get update && apt-get install -y wget python-pip
RUN pip install python-openstackclient
COPY ./run.sh /
ENTRYPOINT ["/run.sh"]
