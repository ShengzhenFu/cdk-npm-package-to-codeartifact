# cdk-npm-package-to-codeartifact

1. Create the CodeArtifact domain
```
aws codeartifact create-domain --domain gaapjan --profile default

```
2. Create the CodeArtifact repository to store the NPM package:
```
aws codeartifact create-repository --domain gaapjan --repository gaapjan-packages --description "NPM demo Repo" --profile default

```
3. NPM login
```
aws codeartifact login --tool npm --repository gaapjan-packages --domain gaapjan --domain-owner your-aws-account --profile default
```
4. `npm init`
5. 
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

6. validate the package in example folder 
```
cd example
npm init --l typescript -y
npm run co:login
npm install gaapjan-npm-package-demo@0.0.7
ts-node src/index.ts
```

7. change back to npmjs
```
npm config set registry https://registry.npmjs.org/
```