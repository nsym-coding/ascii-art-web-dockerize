
##We're using golang's latest image and that's being pulled from
##in the below line
FROM golang:1.17.5

##The RUN command below creates a build directory where our application
## is going to sit and where we're going to call it from.

RUN mkdir /build

ADD . /build

##The command below sets the build directory as our working directory. 
WORKDIR /build


## The RUN command below allows to pull the latest version of any package
## we want from github. 
##RUN export GO111MODULE=on

# RUN git config --global user.email "nsym.coding@outlook.com"
# RUN git config --global user.name "nsym_coding"
# RUN git config --global --add url."git@learn.01founders.co:".insteadOf "https://git.learn.01founders.co/"

# ##Gets our package from github 
# RUN go get git.learn.01founders.co/nsym_coding/ascii-art-web-dockerize/main

##cds into the build folder and clones our git repository, doing it this way 
##means that anytime the image is used it'll clone the latest version of the 
##application on the repo instead of only just doing it for a local program
##that will only ever be what it was when the image was made instead of having
##updates incorporated as well
# RUN cd /build && git clone https://git.learn.01founders.co/nsym_coding/ascii-art-web-dockerize.git

##cds into the build aka our working directory, ascii-art-web-dockerize, which 
##is our repo, and then into the main directory which is where our application
##is and then we'll do a go build on that application
RUN go build -o main

##This exposes the 8080 port as the ListenandServe in our application is 
##listening on port 8080 and this ensure that in Docker we're exposing port 8080
##from a networking perspective on the container port
EXPOSE 8080

##The entrypoint is under build, then our repo, then main and then the 2nd main
##is where our application or executable will be built

ENTRYPOINT [ "/build/ascii-art-web-dockerize/main/main" ]