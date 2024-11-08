FROM amazonlinux:latest

LABEL maintainer="Aaron Maurais -- MacCoss Lab"

# add entrypoint
RUN dnf -y install procps unzip && \
    dnf clean all && \
    cd /usr/local/bin && \
    echo -e '#!/usr/bin/env bash\nset -e\nexec "$@"' > entrypoint && \
    chmod 755 entrypoint

WORKDIR /data

# Git version information
ARG GIT_BRANCH
ARG GIT_REPO
ARG GIT_HASH
ARG GIT_SHORT_HASH
ARG GIT_UNCOMMITTED_CHANGES
ARG GIT_LAST_COMMIT
ARG DOCKER_TAG
ARG DOCKER_IMAGE

ENV GIT_BRANCH=${GIT_BRANCH}
ENV GIT_REPO=${GIT_REPO}
ENV GIT_HASH=${GIT_HASH}
ENV GIT_SHORT_HASH=${GIT_SHORT_HASH}
ENV GIT_UNCOMMITTED_CHANGES=${GIT_UNCOMMITTED_CHANGES}
ENV GIT_LAST_COMMIT=${GIT_LAST_COMMIT}
ENV DOCKER_IMAGE=${DOCKER_IMAGE}
ENV DOCKER_TAG=${DOCKER_TAG}

CMD []
ENTRYPOINT ["/usr/local/bin/entrypoint"]
