#!/bin/bash
GOROOT=/usr/local/go
GOPATH=/usr/local/src/go
PATH=$GOROOT/bin:$PATH
export GOROOT GOPATH PATH

PS1="[\u@\h \W]\$" /bin/bash

