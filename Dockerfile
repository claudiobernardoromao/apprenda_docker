############################################################
# Dockerfile to build Python WSGI Application Containers
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM centos:7

# File Author / Maintainer
MAINTAINER Cromao

# Update the sources list
RUN yum update

# Install basic applications
RUN yum install -y tar git curl nano wget dialog net-tools build-essential

RUN yum install -y epel-release

# Install Python and Basic Python Tools
RUN yum  install -y python python-dev python-distribute python-pip

# Copy the application folder inside the container
ADD /appTest /my_application

# Upgrade pip

RUN pip install --upgrade pip

# Get pip to download and install requirements:
RUN pip install -r /my_application/requirements.txt

# Expose ports
EXPOSE 80

# Set the default directory where CMD will execute
WORKDIR /my_application

# Set the default command to execute    
# when creating a new container
# i.e. using CherryPy to serve the application
CMD python server.py

