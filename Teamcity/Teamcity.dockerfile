FROM jetbrains/teamcity-server:latest
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections && \
    apt-get update && apt-get install -y \
    software-properties-common && \
    apt-get update && \
    apt-get install -y \
    apt-transport-https && \
    curl https://packages.microsoft.com/keys/microsoft.asc | \
    gpg --dearmor > microsoft.gpg && \
    mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg && \
    sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list' && \
    curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | \
    tee /etc/apt/sources.list.d/microsoft.list && \
    echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ wheezy main" | \
    tee /etc/apt/sources.list.d/azure-cli.list && \
    apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893 && \
    apt-get update && \
    apt-get install -y \
    dotnet-sdk-2.1.4 \
    powershell \
    azure-cli
