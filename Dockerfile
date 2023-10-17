FROM ghcr.io/graalvm/graalvm-community:20.0.1-ol9 
# Install tar and gzip to extract the Maven binaries
ARG USER_HOME_DIR="/root"
#ARG MAVEN_DOWNLOAD_URL=https://nexus.conseqta.io/repository/conseqta-cache/apache-maven/apache-maven-3.9.4-bin.tar.gz

RUN mkdir -p /usr/share/maven /usr/share/maven/ref 
#RUN curl -fsSL -o /tmp/apache-maven.tar.gz ${MAVEN_DOWNLOAD_URL} 
COPY apache-maven-3.9.4-bin.tar.gz /tmp/apache-maven.tar.gz 

RUN tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 
RUN rm -f /tmp/apache-maven.tar.gz 
RUN ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

ENV MAVEN_HOME /usr/share/maven
#COPY ./.m2/settings.xml $USER_HOME_DIR/.m2
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"