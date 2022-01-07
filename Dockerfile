ARG IMAGE=intersystemsdc/iris-ml-community:2020.3.0.302.0-zpm  
ARG IMAGE=intersystemsdc/iris-community
FROM $IMAGE  
USER root   

RUN apt-get update
  
RUN apt install python3 python3-pip -y

# Make python available in cmd
RUN export PATH=${PATH}:/usr/bin/python3

WORKDIR /opt/irisapp
RUN chown ${ISC_PACKAGE_MGRUSER}:${ISC_PACKAGE_IRISGROUP} /opt/irisapp

USER ${ISC_PACKAGE_MGRUSER}
RUN pip3 install websocket 
RUN pip3 install websocket-client

# COPY  Installer.cls .
COPY  py py  
COPY  src src  
COPY  module.xml module.xml  
COPY  iris.script /tmp/iris.script  

RUN iris start IRIS \
    && iris session IRIS < /tmp/iris.script \
    && iris stop IRIS quietly  
