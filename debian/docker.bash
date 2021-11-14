keyring_name=docker-archive-keyring.gpg codename=$(. /etc/os-release;echo $VERSION_CODENAME) \
&& curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/$keyring_name \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/$keyring_name] \
https://download.docker.com/linux/debian $codename stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null \
&& sudo apt update && sudo apt install docker-ce docker-ce-cli containerd.io
