#!/usr/bin/bash

wget https://download.oracle.com/java/21/latest/jdk-21_linux-aarch64_bin.tar.gz

tar -xzvf jdk-21_linux-aarch64_bin.tar.gz

sudo mkdir -p /opt/java21
sudo mv jdk-21.0.6/* /opt/java21/
echo "export JAVA_HOME=/opt/java21" >> ~/.bashrc
echo "export PATH=$JAVA_HOME/bin:$PATH" >> ~/.bashrc
source ~/.bashrc

if [ -d /opt/java21/bin ]; then
    echo "Java 24 installed successfully"
    sudo rm -rf jdk-21*
else
    echo "Java 24 installation failed"
fi