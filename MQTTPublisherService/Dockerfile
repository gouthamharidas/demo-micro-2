FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
Workdir /src
COPY MQTTPublisherService.csproj .
RUN dotnet restore "MQTTPublisherService.csproj"
COPY . .
RUN dotnet publish "MQTTPublisherService.csproj" -c Release -o /publish

FROM mcr.microsoft.com/dotnet/aspnet:5.0 as final
WORKDIR /app
COPY --from=build /publish .

ENTRYPOINT ["dotnet", "MQTTPublisherService.dll" ]