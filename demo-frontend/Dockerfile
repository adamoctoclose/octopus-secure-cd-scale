# Stage 1: Build the application
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copy the csproj and restore dependencies
COPY demo-frontend/*.csproj ./demo-frontend/
RUN dotnet restore ./demo-frontend/demo-frontend.csproj

# Copy everything else and build the application
COPY demo-frontend/ ./demo-frontend/
WORKDIR /src/demo-frontend
RUN dotnet publish -c Release -o /app/publish

# Stage 2: Create runtime image
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/publish .

# Expose the port specified in appsettings.json (6000)
EXPOSE 8080

# Start the app
ENTRYPOINT ["dotnet", "demo-frontend.dll"]
