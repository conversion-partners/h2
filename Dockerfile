FROM java:7

MAINTAINER Artur Zeiler <artur.zeiler@ww-informatik.de>

ENV DOWNLOAD http://www.h2database.com/h2-2014-04-05.zip
ENV DATA_DIR /opt/h2-data

RUN curl ${DOWNLOAD} -o h2.zip \
    && unzip h2.zip -d /opt/ \
    && rm h2.zip \
    && mkdir -p ${DATA_DIR}

EXPOSE 81 1521

CMD java -cp "/opt/h2/bin/*" org.h2.tools.Server \
 	-web -webAllowOthers -webPort 81 \
 	-tcp -tcpAllowOthers -tcpPort 1521 \
 	-baseDir ${DATA_DIR}