# azure-base-image
base docker image to use azure services 


# example 

  stages:
    - deploy

  deploy:
    stage: deploy
    image: gborelli/azure-base-image
    script:
      - curl -sL https://aka.ms/InstallAzureCLIDeb | bash
      - apt-get install curl && curl -sL https://deb.nodesource.com/setup_14.x | bash -
      - apt-get install nodejs
      - npm install -g azure-functions-core-tools@3 --unsafe-perm true
      - npm i && npm run build
      - az login --service-principal -u $APPLICATION_ID -p $APPLICATION_SECRET --tenant $TENANT_ID
      - func azure functionapp publish $FUNCTION_APP --typescript --publish-local-settings --overwrite-settings
    only:
      - master
