FROM alpine:3.11.2

ARG HUGO_VERSION=0.54.0

# Install Hugo
RUN apk add --update --no-cache wget ca-certificates git && \
    wget --quiet https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz -O /tmp/hugo.tar.gz && \
    tar -C /tmp -xzf /tmp/hugo.tar.gz && \
    mv /tmp/hugo /usr/bin && \
    rm -rf /tmp/hugo.tar.gz && \
    apk del wget ca-certificates

ENTRYPOINT ["/usr/bin/hugo"]
CMD ["--help"]
