# cdk-npm-package-to-codeartifact
`Notes: In my code i am using a random domain gaapjan. Please change the domain and aws-account to your own needs`
### 1. Create the CodeArtifact domain
```
aws codeartifact create-domain --domain gaapjan --profile default

```
[![Domain](/images/CodeArtifactDomain.jpg "CodeArtifact, Domain")](https://github.com/ShengzhenFu/cdk-npm-package-to-codeartifact/blob/release/images/CodeArtifactDomain.jpg)

### 2. Create the CodeArtifact repository to store the NPM package:
```
aws codeartifact create-repository --domain gaapjan --repository gaapjan-packages --description "NPM demo Repo" --profile default

```
[![Repository](/images/CodeArtifactRepo.jpg "CodeArtifact, Repo")](https://github.com/ShengzhenFu/cdk-npm-package-to-codeartifact/blob/release/images/CodeArtifactRepo.jpg)

### 3. NPM login
```
aws codeartifact login --tool npm --repository gaapjan-packages --domain gaapjan --domain-owner your-aws-account --profile default
```
### 4. `npm init`
### 5. Install dev dependencies
```
npm install --save-dev \
            eslint \
            typescript \
            tslib \
            ts-node \
            rollup \
            @rollup/plugin-commonjs \
            @rollup/plugin-node-resolve \
            @rollup/plugin-typescript \
            @types/jest \
            prettier \
            jest \
            @types/jest \
            ts-jest
```
### 6. Publish NPM packaget to CodeArtifact repo
```
npm run build
npm run prepublish
npm publish
```
should be able to see the publish logs like below
[![publish](/images/CodeArtifactNPMPublish.jpg "CodeArtifact, Package")](https://github.com/ShengzhenFu/cdk-npm-package-to-codeartifact/blob/release/images/CodeArtifactNPMPublish.jpg)


would be able to see the package in the repo
[![package](/images/CodeArtifact-Package.jpg "CodeArtifact, Package")](https://github.com/ShengzhenFu/cdk-npm-package-to-codeartifact/blob/release/images/CodeArtifact-Package.jpg)


### 7. validate the package in another TS code 
```
cd example
npm init --l typescript -y
npm run co:login
npm install gaapjan-npm-package-demo@0.0.7
ts-node src/index.ts
```

### 8. change back to npmjs 
```
npm config set registry https://registry.npmjs.org/
```

### 9. remove everything
TO-DO