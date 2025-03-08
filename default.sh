sudo apt-get update -y
sudo sudo dpkg --configure -a
sudo apt-get -y install build-essential perl libncurses5-dev libncursesw5-dev checkinstall zlib1g-dev wget vim xz-utils procps
    
sudo useradd -m -s /bin/bash master
echo "master:123qwe" | sudo chpasswd
sudo usermod -aG sudo master
su - master
