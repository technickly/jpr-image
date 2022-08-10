# Get VM OS 
root@d6fbb8d7b246:/# grep ID /etc/os-release
VERSION_ID="22.04"
ID=ubuntu
ID_LIKE=debian

# Get VM Python version
root@d6fbb8d7b246:/# python --version
Python 2.7.18

Get VM Pip version and path
root@d6fbb8d7b246:/# whereis pip
pip: /usr/local/bin/pip
root@d6fbb8d7b246:/# pip --version
pip 20.3.4 from /usr/local/lib/python2.7/dist-packages/pip (python 2.7)

See Python Library/Versions
root@d6fbb8d7b246:/# pip freeze --no-python-version-warning > requirements.txt
root@d6fbb8d7b246:/# cat requirements.txt
configparser==4.0.2
contextlib2==0.6.0.post1
importlib-metadata==2.1.3
pathlib2==2.3.7.post1
scandir==1.10.0
six==1.16.0
SQLAlchemy==1.4.40
typing==3.10.0.0
zipp==1.2.0

Edit local requirements.txt/entrypoint.sh as needed

Build Image

docker build -t image4vm .
docker run -it image4vm
