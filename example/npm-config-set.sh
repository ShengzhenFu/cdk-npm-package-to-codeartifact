#! /bin/bash

AWS_PROFILE=$1
## References https://stackoverflow.com/a/67034959
query='repositoryEndpoint'
endpoint=`aws codeartifact get-repository-endpoint --domain gaapjan --profile $AWS_PROFILE --domain-owner your-aws-account --repository gaapjan-packages --format npm --query $query`
npm config set @gaapjan:registry $endpoint
token=`aws codeartifact get-authorization-token --domain gaapjan --profile $AWS_PROFILE --domain-owner your-aws-account --query authorizationToken --output text`
npm config set //gaapjan-your-aws-account.d.codeartifact.us-west-2.amazonaws.com/npm/gaapjan-packages/:_authToken=$token
npm config set //gaapjan-your-aws-account.d.codeartifact.us-west-2.amazonaws.com/npm/gaapjan-packages/:always-auth=true
exit