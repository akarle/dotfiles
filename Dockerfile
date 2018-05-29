# Start with a base of Ubuntu
FROM ubuntu:xenial

# Install needed packages
RUN apt-get update
RUN apt-get install -y curl git vim

# Create new user (makes home + sets bash as shell)
RUN useradd -ms /bin/bash akarle

# Switch user
USER akarle

# copy in install script!
WORKDIR /home/akarle
COPY install.sh ./install.sh

# Start bash on enter
CMD ["/bin/bash"]
