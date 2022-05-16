keyring_name=nvidia-cuda-archive-keyring.gpg dist=$(. /etc/os-release;echo $ID$VERSION_ID) &&
	curl -fsSL https://developer.download.nvidia.com/compute/cuda/repos/$dist/x86_64/3bf863cc.pub |
	sudo gpg --dearmor -o /usr/share/keyrings/$keyring_name &&
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/$keyring_name] https://developer.download.nvidia.com/compute/cuda/repos/$dist/x86_64/ /" |
	sudo tee /etc/apt/sources.list.d/nvidia-cuda.list
