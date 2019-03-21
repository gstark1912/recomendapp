FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /src
COPY ["Nemesis/Nemesis.API.csproj", "Nemesis/"]
COPY ["Nemesis.Mapper/Nemesis.Mapper.csproj", "Nemesis.Mapper/"]
COPY ["Nemesis.Dtos/Nemesis.Dtos.csproj", "Nemesis.Dtos/"]
COPY ["Nemesis.DAL/Nemesis.DAL.csproj", "Nemesis.DAL/"]
COPY ["Nemesis.Utils/Nemesis.Utils.csproj", "Nemesis.Utils/"]
COPY ["Nemesis.IServices/Nemesis.IServices.csproj", "Nemesis.IServices/"]
COPY ["Nemesis.Integration/Nemesis.Integration.csproj", "Nemesis.Integration/"]
COPY ["Nemesis.Service/Nemesis.Services.csproj", "Nemesis.Service/"]
COPY ["Transactions/Transactions.csproj", "Transactions/"]
RUN dotnet restore "Nemesis/Nemesis.API.csproj"
COPY . .
WORKDIR "/src/Nemesis"
RUN dotnet build "Nemesis.API.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "Nemesis.API.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Nemesis.API.dll"]