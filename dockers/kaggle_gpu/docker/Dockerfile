FROM gcr.io/kaggle-gpu-images/python:v109
RUN add-apt-repository ppa:neovim-ppa/stable \
    && apt-get update && apt-get -y install neovim \
    && jupyter lab build \
    && pip install timm \
    && git clone https://github.com/topazape/dotfiles.git /root/dotfiles \
    && cd /root/dotfiles && make
WORKDIR /workspace

ENTRYPOINT [ "/entrypoint.sh", "jupyter", "lab", "--allow-root", "--no-browser", "--ip=0.0.0.0", "--port=8888", "--ServerApp.token=''", "--ServerApp.password=''" ]
