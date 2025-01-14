# Stage 1: Build the application
FROM maven:3.9.6 AS build
WORKDIR /app
COPY pom.xml /app/
COPY src /app/src
RUN mvn clean package -DskipTests=true && java -Djarmode=layertools -jar /app/target/demo.jar extract

# Stage 2 (Runtime)
FROM openjdk:21
WORKDIR /app
COPY --from=build /app/dependencies/ /app/dependencies/
COPY --from=build /app/spring-boot-loader/ /app/sb-loader/
COPY --from=build /app/snapshot-dependencies/ /app/snapshots/
COPY --from=build /app/target/demo.jar /app/

CMD ["java", "-jar", "/app/demo.jar"]
