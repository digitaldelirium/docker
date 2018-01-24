FROM jetbrains/teamcity-server:latest
RUN apt-get update && apt-get install -y \
    software-properties-common && \
    add-apt-repository ppa:webupd8team/java && \
    curl https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor > microsoft.gpg && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" | \
    tee /etc/apt/sources.list.d/dotnetdev.list && \
    curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | \
    tee /etc/apt/sources.list.d/microsoft.list && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main" | \
    tee /etc/apt/sources.list.d/azure-cli.list && \
    apt-get update && \
    apt-get install -y \
    apt-transport-https && \
    apt-get install -y \
    dotnet-sdk-2.1.4 \
    powershell \
    azure-cli