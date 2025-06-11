FROM tomcat:9.0-jdk11-temurin

ENV CATALINA_HOME=/usr/local/tomcat
ENV SAKAI_HOME=$CATALINA_HOME/sakai

# Instalar utilidades necesarias
RUN apt-get update && apt-get install -y wget unzip && rm -rf /var/lib/apt/lists/*

# Crear directorios necesarios
RUN mkdir -p $SAKAI_HOME

# Descargar y descomprimir Sakai
WORKDIR $CATALINA_HOME
RUN wget -q https://source.sakaiproject.org/release/23.3/artifacts/sakai-bin-23.3.tar.gz \
    && tar xzf sakai-bin-23.3.tar.gz \
    && rm sakai-bin-23.3.tar.gz

# Configurar Sakai
COPY sakai.properties $SAKAI_HOME/sakai.properties
COPY setenv.sh $CATALINA_HOME/bin/setenv.sh
RUN chmod +x $CATALINA_HOME/bin/setenv.sh

# Descargar MySQL connector
RUN wget -q https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.0.33/mysql-connector-j-8.0.33.jar \
    -O $CATALINA_HOME/lib/mysql-connector-java.jar

EXPOSE 8080

CMD ["catalina.sh", "run"]
