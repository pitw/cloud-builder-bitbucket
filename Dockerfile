FROM golang:alpine

  # Install VCS tools to support "go get" commands and install gcc.
RUN apk add --update --no-cache git mercurial subversion wget build-base

  # Replace for Bitbucket Private Repos
RUN git config --global url."git@bitbucket.org:".insteadOf "https://bitbucket.org/"

  # To be sure also replace api.bitbucket.org
RUN git config --global url."git@bitbucket.org:".insteadOf "https://api.bitbucket.org/"

  # dep
RUN curl https://raw.githubusercontent.com/golang/dep/master/install.sh | sh

  # Windows Resource generation
RUN go get github.com/josephspurrier/goversioninfo && \
go install github.com/josephspurrier/goversioninfo/cmd/goversioninfo
