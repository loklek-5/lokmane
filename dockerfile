# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang

# Copy the local package files to the container's workspace.
ADD . /go/src/github.com/loklek-5/lokmane
#ADD ./web/client /static/ 



# Build the outyet command inside the container.
# fetching dependencies
RUN go get github.com/nu7hatch/gouuid
RUN go get github.com/julienschmidt/httprouter
RUN go get github.com/fatih/color

# install the main project
RUN go install github.com/loklek-5/lokmane


# Run the outyet command by default when the container starts.
ENTRYPOINT ["/go/bin/loklek-5/lokmane"]


# default command
CMD ["--help"]
