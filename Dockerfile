FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src
#COPY ["DemoAPIAzure467/DemoAPIAzure467.csproj", "DemoAzureApi/"]
#COPY /DemoAPIAzure467/DemoAPIAzure467.csproj .
COPY WebApplication08.csproj .
RUN dotnet restore
COPY . .
RUN dotnet publish -c release -o /app

FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /app
COPY --from=build /app .
ENTRYPOINT ["dotnet", "WebApplication08.dll"]
