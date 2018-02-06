# This is the base image which determines from which Docker image the container should derive.
#FROM microsoft/aspnetcore-build:2.0
FROM microsoft/dotnet:latest

# Copy the files and folders from current directory to "app" directory
COPY . /app

# Set the working directory as "app" directory
WORKDIR /app

# Run the following commands in Linux Terminal to restore .NET Core packages
#RUN ["dotnet", "restore"]
RUN dotnet restore

# Build the application
RUN dotnet publish -c Release -o out /app

RUN ls /app/
RUN ls /app/bin/Release/netcoreapp2.0/
# Expose a port number from the container to outside world
EXPOSE 5000

# Determine an entry point of the application.
#ENTRYPOINT ["dotnet", "run", "--server.urls", "http://0.0.0.0:5000"]
# Build runtime image
#FROM microsoft/aspnetcore-build:2.0
#WORKDIR /api
#COPY --from=build-env /app/out .
#COPY /app/bin/Release/netcoreapp2.0/ /app/
ENTRYPOINT dotnet /app/bin/Release/netcoreapp2.0/NotebookAppApi.dll
#CMD ["/usr/bin/dotnet", "NotebookAppApi.dll"]
