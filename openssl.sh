sudo echo "Installing Open SSL"
cd ~
sudo wget https://www.openssl.org/source/openssl-3.1.2.tar.gz
sudo tar -xf openssl-3.1.2.tar.gz 
cd openssl-3.1.2
sudo ./config
sudo make
sudo make install
sudo echo LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/opt/openssl/3.12/" >> ~/.bashrc