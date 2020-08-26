FROM websphere-liberty
USER root
RUN apt-get update

ADD server.xml     /opt/ibm/wlp/usr/servers/defaultServer
ADD key.xml        /opt/ibm/wlp/usr/servers/defaultServer
ADD test.sh /
RUN chmod +x /test.sh
CMD [ "bash" ] 