FROM ubuntu:latest

LABEL MAINTAINER="Julien Sabatier <julien.sabatier@lepuyenvelay.fr>"

ARG JAVA_VERSION=11

RUN apt-get update -q

# Set locale
RUN apt-get install -qy locales
RUN locale-gen fr_FR.UTF-8 && update-locale

# Install build deps
RUN apt-get install -qy gradle android-sdk npm

# Install Ionic 6
RUN npm install -g @ionic/cli
