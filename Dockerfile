FROM docker:stable

RUN apk add --no-cache curl jq python py-pip
RUN pip install awscli
RUN pip install boto3
