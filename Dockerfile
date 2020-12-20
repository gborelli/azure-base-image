FROM mcr.microsoft.com/dotnet/core/sdk:3.1

RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
RUN apt-get install curl && curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install nodejs
RUN npm install -g azure-functions-core-tools@3 --unsafe-perm true
