
# Use the official Node.js 14 image as a build environment.
FROM node:18 AS build

# Set the working directory.
WORKDIR /app

# Copy the package.json and package-lock.json files to the container.
COPY my-workspace/package*.json ./

# Install the dependencies.
RUN npm install

# Copy the rest of the application code to the container.
COPY my-workspace/. .

# Build the Angular app.
RUN npm run build example-app --prod

# Use the official .NET 7 SDK image to build the API.
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS api-build

# Set the working directory.
WORKDIR /app

# Copy the .csproj file to the container.
COPY api/*.csproj ./

# Restore the dependencies.
RUN dotnet restore

# Copy the rest of the application code to the container.
COPY api/. .

# Build the API.
RUN dotnet build -c Release -o /app/build

# Use the official .NET 7 runtime image to run the API.
FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS api-runtime

# Set the working directory.
WORKDIR /app

# Copy the build output from the previous stage to this stage.
COPY --from=api-build /app/build ./

# Copy the Angular app to the wwwroot folder.
COPY --from=build /app/dist/example-app/browser ./wwwroot

# Expose the port that the API listens on.
EXPOSE 80

# Start the API.
ENTRYPOINT ["dotnet", "api.dll"]
