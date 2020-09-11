# Set the base image
FROM ubuntu:16.04

# Update software repository
# and install dependencies
run dpkg --add-architecture i386
run apt-get update && apt-get install -y curl unzip libx11-6:i386 libgl1-mesa-glx:i386 libfontconfig1:i386 libssl1.0.0:i386 libcairo2:i386

RUN mkdir cormas && cd cormas
RUN curl https://get.pharo.org | bash
RUN ./pharo Pharo.image eval "Metacello new onWarningLog; repository: 'github://cormas/cormas/repository'; baseline: 'Cormas'; load. Smalltalk snapshot: true andQuit: true"
