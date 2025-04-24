FROM maven AS buildstage
RUN mkdir /opt/pallavi_D
WORKDIR /opt/pallavi_D
COPY . .
RUN mvn clean install

FROM tomcat
WORKDIR webapps
COPY --from=buildstage /opt/pallavi_D/target/*.war .
RUN rm -rf ROOT && mv *.war ROOT.war
EXPOSE 8080
