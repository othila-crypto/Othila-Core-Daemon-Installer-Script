# Othila Core Daemon Installer Script for Ubuntu 18.04

The following script will automate the install of the Othila Core Daemon.

You must have git installed on the server.

```sudo apt-get install git -y```

Next, clone the repository.

```git clone https://github.com/othila-crypto/Othila-Core-Daemon-Installer-Script.git```.

## Othila-Core-Daemon-Installer-Script
Use this script to setup the Othila Core daemon. 

Change into the cloned directory ```cd Othila-Core-Daemon-Installer-Script```

Run the setup script as root using ```sudo ./Othila-Core-Daemon-Installer.sh```

Once the installer is complete, run the daemon with ```othilad --daemon```
