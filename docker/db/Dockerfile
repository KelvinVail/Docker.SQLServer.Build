# escape=`

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS builder
ARG BuildId=localhost
LABEL dacpac=${BuildId}
WORKDIR /src
COPY ["src/AdventureWorksDW.Build/AdventureWorksDW.Build.csproj", "AdventureWorksDW.Build/"]
RUN dotnet restore "AdventureWorksDW.Build/AdventureWorksDW.Build.csproj"
COPY . .
RUN dotnet build "AdventureWorksDW.Build/AdventureWorksDW.Build.csproj" -c Release -o /dacpacs --no-restore

FROM mcr.microsoft.com/mssql/server:2022-preview-ubuntu-22.04 

# ENV ACCEPT_EULA="Y" `
#     # DATA_PATH="C:\data" `
#     sa_password="DockerCon!!!"

# # VOLUME ${DATA_PATH}

# Install Unzip
RUN apt-get update && apt-get install unzip -y

# Install SQLPackage for Linux and make it executable
RUN wget -progress=bar:force -q -O sqlpackage.zip https://go.microsoft.com/fwlink/?linkid=873926 `
    && unzip -qq sqlpackage.zip -d /opt/sqlpackage `
    && chmod +x /opt/sqlpackage/sqlpackage

WORKDIR /init

COPY --from=builder /dacpacs/ .
# COPY docker/db/Initialize-Database.ps1 .
# CMD powershell ./Initialize-Database.ps1 -sa_password $env:sa_password -data_path $env:data_path -Verbose
