echo "Creating Rabbitmq User"
sudo mkdir -p /opt/rabbitmq
sudo mkdir -p /opt/rabbitmq/4.0.7
sudo chown -R $USER:www-data /opt/rabbitmq/4.0.7/
sudo chmod -R 775 /opt/rabbitmq/4.0.7/

sudo echo "Installing RabbitMQ 4.0.7"
sudo wget https://github.com/rabbitmq/rabbitmq-server/releases/download/v4.0.7/rabbitmq-server-generic-unix-4.0.7.tar.xz
sudo tar -xJf rabbitmq-server-generic-unix-4.0.7.tar.xz -C /opt/rabbitmq
sudo mv /opt/rabbitmq/rabbitmq_server-4.0.7/* /opt/rabbitmq/4.0.7
sudo echo RABBITMQ_HOME=/opt/rabbitmq/4.0.7/ >> ~/.bashrc
sudo echo 'export PATH="/opt/rabbitmq/4.0.7/sbin:$PATH"' >> ~/.bashrc
source ~/.bashrc

echo "[Unit]
Description=RabbitMQ Service

[Service]
Environment=\"PATH=/opt/rabbitmq/4.0.7/sbin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games:/opt/erlang/26.0.2/bin\" \"RABBITMQ=/opt/rabbitmq/4.0.7\"
ExecStart=/opt/rabbitmq/4.0.7/sbin/rabbitmq-server
Restart=always
User=master
Group=www-data
WorkingDirectory=/opt/rabbitmq/4.0.7
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target" | sudo tee /etc/systemd/system/rabbitmq.service
sudo systemctl daemon-reload
sudo systemctl enable rabbitmq.service
sudo systemctl start rabbitmq.service
sudo systemctl status rabbitmq.service
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 15672
    
# File Permissions
# 
# https://stackoverflow.com/questions/23411520/how-to-fix-error-laravel-log-could-not-be-opened
# 
# To Debud System Serivce 
# 
# https://containersolutions.github.io/runbooks/posts/linux/debug-systemd-service-units/
# 
# sudo runuser -l <User> -g <Group> -c "cd <WorkingDirectory> && <PATH> <ExecStart>"
