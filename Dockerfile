FROM eaiesbhub/tomcat85
COPY target//vprofile-*.war /root/apache-tomcat-8.5.31/webapps/vprofile.war
