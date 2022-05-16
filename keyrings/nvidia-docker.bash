keyring_name=nvidia-docker.gpg distribution=$(. /etc/os-release;echo $ID$VERSION_ID) && 
	curl -fsSL https://nvidia.github.io/nvidia-docker/gpgkey |
	sudo gpg --dearmor -o /usr/share/keyrings/$keyring_name &&
	curl -fsSL https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list |
	sed -e "s/deb /deb [arch=$(dpkg --print-architecture) signed-by=\/usr\/share\/keyrings\/$keyring_name] /g" |
	sudo tee /etc/apt/sources.list.d/nvidia-docker.list
