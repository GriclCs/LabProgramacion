FROM microsoft/dotnet:2.2-sdk AS build-env

WORKDIR /app



# Copiar csproj y restaurar como capas distintas

COPY *.csproj ./

RUN dotnet restore



# Copia todo lo demás y construye

COPY . ./

RUN dotnet publish -c Liberación -o out



# Crear imagen en tiempo de ejecución

FROM microsoft/dotnet:2.2-aspnetcore-runtime

WORKDIR /app

COPY --from -build-env /app/out .

CMD ASPNETCORE_URLS-http://*:$PORT dotnet Devops.dll