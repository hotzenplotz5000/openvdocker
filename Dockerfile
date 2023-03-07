FROM debian:latest
MAINTAINER hotzenplotz5000
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y mosquitto-clients
COPY root / 
ENV OPTOLINK /dev/ttyUSB0
ENV IPMQTTBROKER 192.168.8.40
ENV PORTMQTTBROKER 1883
ENV MQTTTOPIC vcontrol
ENV MQTT true
ENV MQTTPUB 30
EXPOSE 3002/udp
ENTRYPOINT ["sh","/etc/vcontrold/run.sh"]
