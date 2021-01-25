The offical Docker in docker image with AWS-CLI. Useful for pipelines.

Usage
-----

Replace `image: docker:stable` by `image: brutale/docker-aws-cli` and your pipelines can make use of the `aws` command. It saves some processing and CI minutes.

## Gitlab CI integration with push to Amazon Container Registry
The following `.gitlab-ci.yml` is an example on how to build a Docker image and push it to AWS ECR.

Make sure to set the following environment variables in the CI/CD configuration, or add them under the `variables` section:

- $AWS_ACCESS_KEY_ID
- $AWS_SECRET_ACCESS_KEY
- $AWS_DEFAULT_REGION

```
image: brutale/docker-aws-cli:v1

services:
  - docker:dind

variables:
  REPOSITORY_URL: YOUR_AWS_NUMERIC_ID.dkr.ecr.YOUR_REGION.amazonaws.com/SOME_REPO

stages:
  - build

build:
  stage: build
  script:
    - $(aws ecr get-login --no-include-email --region eu-west-1)
    - docker build -t "${REPOSITORY_URL}:${CI_COMMIT_SHORT_SHA}" .
    - docker tag "${REPOSITORY_URL}:${CI_COMMIT_SHORT_SHA}" "${REPOSITORY_URL}:latest"
    - docker push "${REPOSITORY_URL}"
  only:
    - master
```
