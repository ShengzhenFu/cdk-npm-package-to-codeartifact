#! /bin/bash

AWS_PROFILE=$1
## References https://stackoverflow.com/a/67034959
query='repositoryEndpoint'
endpoint=`aws codeartifact get-repository-endpoint --domain gaapjan --profile $AWS_PROFILE --domain-owner 440900076177 --repository gaapjan-packages --format npm --query $query`
npm config set @gaapjan:registry $endpoint
token=`aws codeartifact get-authorization-token --domain gaapjan --profile $AWS_PROFILE --domain-owner 440900076177 --query authorizationToken --output text`
npm config set //gaapjan-440900076177.d.codeartifact.us-west-2.amazonaws.com/npm/gaapjan-packages/:_authToken=$token
npm config set //gaapjan-440900076177.d.codeartifact.us-west-2.amazonaws.com/npm/gaapjan-packages/:always-auth=true
exit