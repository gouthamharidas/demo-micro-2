FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
Workdir /src
COPY OrderProcessingWorker.csproj .
RUN dotnet restore "OrderProcess/worker.csproj"
COPY . .
RUN dotnet publish "OrderProcessingWorker.csproj" -c Release -o /publish

FROM mcr.microsoft.com/dotnet/aspnet:5.0 as final
WORKDIR /app
COPY --from=build /publish .

ENTRYPOINT ["dotnet", "OrderProcessingWorker.dll" ]