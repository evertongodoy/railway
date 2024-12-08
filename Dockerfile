# Stage 1: Build the application
FROM maven:3.9.4-eclipse-temurin-21 AS build

# Configurar diretório de trabalho
WORKDIR /app

# Copy pom.xml and dependencies
COPY pom.xml ./
RUN mvn dependency:go-offline -B

# Copy the rest of the application source code
COPY src ./src

# Build the application
RUN mvn clean install -DskipTests

# Use a imagem base de Java 21
FROM eclipse-temurin:21-jre

# Copiar o JAR para o contêiner
COPY target/railway-0.0.1-SNAPSHOT.jar app.jar

# Expor a porta
EXPOSE 8080

# Comando para executar o aplicativo
ENTRYPOINT ["java", "-XX:MaxRAMPercentage=75", "-Dserver.port=8080", "-jar", "app.jar"]
