#
# Build stage
#
FROM maven

WORKDIR /app

RUN apt-get update && apt-get install -y git vim

RUN git clone https://github.com/NielsdeG/backend-webshop.git /app

COPY application.properties /app/src/main/resources/application.properties

RUN mvn -f /app/pom.xml clean package

#
# Package stage
#
#FROM gcr.io/distroless/java

#COPY --from=build /app/src/app/target/demo-0.0.1-SNAPSHOT.jar /app/demo-0.0.1-SNAPSHOT.jar  

#EXPOSE 8080  

#ENTRYPOINT ["java","-jar","/app/demo-0.0.1-SNAPSHOT.jar"]  
