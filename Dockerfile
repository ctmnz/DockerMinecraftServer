FROM centos:centos7

MAINTAINER Daniel Stoinov <daniel.stoinov@investor.bg>

RUN yum -y update; yum clean all
RUN yum -y install java-1.7.0-openjdk wget
RUN mkdir /minecraft
RUN wget -O /minecraft/minecraft.jar https://s3.amazonaws.com/Minecraft.Download/versions/1.8.1/minecraft_server.1.8.1.jar
RUN chmod +x /minecraft/minecraft.jar

VOLUME /minecraft
WORKDIR /minecraft

ADD ./eula.txt /minecraft/eula.txt
ADD ./server.properties /minecraft/server.properties
ADD ./ops.txt /minecraft/ops.txt


EXPOSE 25565

CMD java -Xmx1600M -Xms768M -jar minecraft.jar nogui EULA=TRUE

