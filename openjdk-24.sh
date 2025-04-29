#!/usr/bin/bash

wget https://download.oracle.com/java/24/latest/jdk-24_linux-aarch64_bin.tar.gz
tar -xzvf jdk-24_linux-aarch64_bin.tar.gz

sudo mkdir -p /opt/java24
sudo mv jdk-24/* /opt/java24/
echo "export JAVA_HOME=/opt/java24" >> ~/.bashrc
echo "export PATH=$JAVA_HOME/bin:$PATH" >> ~/.bashrc
source ~/.bashrc

if [ -d /opt/java24/bin ]; then
    echo "Java 24 installed successfully"
    sudo rm -rf jdk-24_linux-aarch64_bin.tar.gz jdk-24
else
    echo "Java 24 installation failed"
fi