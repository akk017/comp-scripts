echo "Installing Erlang 26.0.2"
cd ~
sudo wget https://github.com/erlang/otp/releases/download/OTP-26.0.2/otp_src_26.0.2.tar.gz
sudo tar -xf otp_src_26.0.2.tar.gz 
cd otp_src_26.0.2
sudo mkdir -p /opt/erlang
sudo mkdir -p /opt/erlang/26.0.2
sudo ./configure --prefix=/opt/erlang/26.0.2
sudo make
sudo make install
sudo echo PATH="$PATH:/opt/erlang/26.0.2/bin" >> ~/.bashrc
source ~/.bashrc