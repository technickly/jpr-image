# Different ubuntu flavors for base https://hub.docker.com/_/ubuntu/
# Example Image if VM Ubuntu 18.0.4 (Bionic)
FROM ubuntu:bionic
LABEL owner="Hundo -P"

# Change working directory
WORKDIR /opt/

# Change this to name of project repo
ENV gitrepo=project1

# Update for linux distro
RUN apt-get update -y

# Get any OS libraries
RUN apt-get install -y curl vim git cowsay python-minimal

# Gets pip for python2.7
# URL for different pip for different python: https://bootstrap.pypa.io/pip/
RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py -o get-pip.py

# Installs pip  for python2.7
RUN python2.7 get-pip.py
RUN rm get-pip.py


# Clone hard-coded repo
# RUN git clone https://github.com/technickly/project1.git

# Pass in repo ENV from beginning of Dockerfile
RUN git clone https://github.com/technickly/$gitrepo.git

# Adds local python requirements and image entrypoint shell script
COPY requirements.txt /opt/requirements.txt
COPY entrypoint.sh /opt/entrypoint.sh

# Installs python libraries to match old VM
RUN pip install -r /opt/requirements.txt

# Kicks off entry shell script
ENTRYPOINT ["/bin/bash", "/opt/entrypoint.sh"]
