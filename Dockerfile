# Use a imagem base de Java 21
FROM eclipse-temurin:21-jre

# Configurar diretório de trabalho
WORKDIR /app

# Copiar o JAR para o contêiner
COPY target/railway-0.0.1-SNAPSHOT.jar app.jar

# Expor a porta
EXPOSE 8080

# Comando para executar o aplicativo
ENTRYPOINT ["java", "-XX:MaxRAMPercentage=75", "-Dserver.port=8080", "-jar", "app.jar"]
