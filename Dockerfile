FROM microsoft/dotnet:2.1-sdk AS build-env
WORKDIR /app
# Copiar csproj y restaurar como capas distintas
COPY *.csproj ./
RUN dotnet restore
# Copia todo lo demás y construye
COPY . ./
RUN dotnet publish -c Release -o out
# Crear imagen en tiempo de ejecución
FROM microsoft/dotnet:2.1-aspnetcore-runtime
WORKDIR /app
COPY --from=build-env /app/out .
CMD ASPNETCORE_URLS-http://*:$PORT dotnet LabProgramacion.dll