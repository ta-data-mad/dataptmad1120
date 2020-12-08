 apt-get update -q
 su - vagrant

 echo "downloading miniconda"
 wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
 chmod +x miniconda.sh

echo "installing miniconda"
./miniconda.sh -b -p /home/vagrant/miniconda3
sudo chown -R vagrant:vagrant /home/vagrant/miniconda3
eval "$(/home/vagrant/miniconda3/bin/conda shell.bash hook)"

echo "Initializing miniconda"
sudo chown -R vagrant:vagrant /home/vagrant/miniconda3
export PATH="/home/vagrant/miniconda3/bin:$PATH"
echo ". /home/vagrant/miniconda3/etc/profile.d/conda.sh" >> /home/vagrant/.bashrc
conda config --add channels conda-forge

echo "Creating jupyter env"
conda create --name jupyter_env python=3.8
sudo chown -R vagrant:vagrant /home/vagrant/miniconda3
for package in jupyterhub jupyterlab nodejs nb_conda_kernels; do conda install -n jupyter_env -c conda-forge -y $package; done

echo "Creating ironhack env"
conda create --name ironhack_env python=3.8
sudo chown -R vagrant:vagrant /home/vagrant/miniconda3
for package in pandas tensorflow=2.3.0 ipykernel scikit-learn; do conda install -n ironhack_env -y $package; done
for package in fbprophet pyarrow; do conda install -n ironhack_env -c conda-forge -y $package; done

echo "Creating Jupyterhub service definition"
sudo cat << EOF > /etc/systemd/system/jupyterhub.service
[Unit]
Description=JupyterHub
After=network.target

[Service]
User=root
Environment="PATH=/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/home/vagrant/miniconda3/envs/jupyter_env/bin:/home/vagrant/miniconda3/bin"
ExecStart=/home/vagrant/miniconda3/envs/jupyter_env/bin/jupyterhub --Spawner.notebook_dir='/vagrant'

[Install]
WantedBy=multi-user.target
EOF

echo "Activating Jupyterhub service definition"
sudo systemctl daemon-reload
sudo systemctl start jupyterhub
sudo systemctl enable jupyterhub

