keyring_name=docker-archive-keyring.gpg codename=$(. /etc/os-release;echo $VERSION_CODENAME) dist=$(. /etc/os-release;echo $ID) &&
	curl -fsSL https://download.docker.com/linux/$dist/gpg |
	sudo gpg --dearmor -o /usr/share/keyrings/$keyring_name &&
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/$keyring_name] https://download.docker.com/linux/$dist $codename stable" |
	sudo tee /etc/apt/sources.list.d/docker.list
