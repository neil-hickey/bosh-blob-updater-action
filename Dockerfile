FROM ubuntu

ENV BOSH_CLI_VERSION="6.4.4"

RUN apt-get update && apt-get install -y \
  curl

RUN curl -sSLo /usr/local/bin/bosh "https://github.com/cloudfoundry/bosh-cli/releases/download/v${BOSH_CLI_VERSION}/bosh-cli-${BOSH_CLI_VERSION}-linux-amd64" \
  && chmod +x /usr/local/bin/bosh

COPY bump.bash /bump.bash

ENTRYPOINT ["/bump.bash"]
