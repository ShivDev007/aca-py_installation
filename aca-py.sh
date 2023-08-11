#!/bin/bash

# Update packages 
sudo apt update
sudo apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget

# Install dependencies
sudo apt install -y libpq-dev python3-dev

# Download Python source code
wget https://www.python.org/ftp/python/3.11.4/Python-3.11.4.tgz

# Extract and compile Python
tar -xf Python-3.11.4.tgz
cd Python-3.11.4
./configure --enable-optimizations
make -j 8
sudo make altinstall

# Set up symlinks
sudo update-alternatives --install /usr/bin/python3 python3 /usr/local/bin/python3.11 1

# Install PyTorch
pip3 install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1+cu117 -f https://download.pytorch.org/whl/cu117/torch_stable.html

# Install ACA-Py
git clone https://github.com/anthropic/aca-py.git
cd aca-py
pip3 install -r requirements.txt
pip3 install .

# Clean up downloaded files
rm Python-3.11.4.tgz

echo "Python 3.11.4, PyTorch and ACA-Py have been successfully installed!"
