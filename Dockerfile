FROM microsoft/dotnet:2.1-sdk AS build-env
WORKDIR /app
 
# Copy csproj and restore as distinct layers
COPY src/Recomendapp/*.csproj ./
COPY nuget.config ./
RUN dotnet restore --configfile ./nuget.config
 
# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out

# Build runtime image
FROM microsoft/dotnet:2.1-aspnetcore-runtime
WORKDIR /app
COPY --from=build-env /app/src/Recomendapp/out .

RUN mkdir -p /log
#ENV ASPNETCORE_URLS http://*:80
EXPOSE 80

CMD ["dotnet", "Recomendapp.dll"]
