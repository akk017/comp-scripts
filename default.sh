sudo apt-get update -y
sudo sudo dpkg --configure -a
sudo apt-get -y install build-essential perl libncurses5-dev libncursesw5-dev checkinstall zlib1g-dev wget vim xz-utils procps unzip zip
    
sudo useradd -m -s /bin/bash master
echo "master:yfrM2i02Jg3PnN8" | sudo chpasswd
sudo usermod -aG sudo master
su - master

# Install GO Task 
sudo sh -c "$(curl --location https://taskfile.dev/install.sh)" -- -d -b /usr/bin
