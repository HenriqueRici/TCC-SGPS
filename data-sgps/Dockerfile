FROM maven:3.9.2-amazoncorretto-17 as build
WORKDIR /app
COPY ./ /app

RUN mvn clean package -DskipTests


FROM amazoncorretto:17-alpine

RUN apk add --no-cache fontconfig ttf-dejavu
RUN apk add tzdata
WORKDIR /app
COPY --from=build /app/target/*.jar ./api.jar

ENTRYPOINT [ "sh", "-c", "java -Djava.security.egd=file:/dev/./urandom -Duser.region=BR -Duser.language=pt ${JAVA_OPTS} -jar /app/api.jar" ]