#!/bin/bash
# this script installs all desired packages in the new guest VM

# optimize apt sources to select best mirror
perl -pi -e 's@^\s*(deb(\-src)?)\s+http://us.archive.*?\s+@\1 mirror://mirrors.ubuntu.com/mirrors.txt @g' /etc/apt/sources.list

# update repositories
apt-get update

# msttcorefonts hack
echo ttf-mscorefonts-installer \
   msttcorefonts/accepted-mscorefonts-eula \
   select true \
   | sudo debconf-set-selections

# install the RNS windows wallet for illustration purposes 
apt-get -y install winetricks unzip
add-apt-repository -y ppa:ricotz/unstable
# update repositories
apt-get update && apt-get -y install wine-stable winetricks

# Install the RNS windows wallet for illustration purposes 
# This crashes on 16.04 for some reason, try another win compat setting
#
cat > /usr/local/bin/bismuth <<'EOF'
#!/bin/bash
winetricks settings winxp
if [ ! -f "Bismuth_installer.exe" ]; then wget https://github.com/hclivess/Bismuth/releases/download/3.23/Bismuth_installer.exe; fi
wine Bismuth_installer.exe
EOF

# installer permissions
chmod 775 /usr/local/bin/bismuth

# run the wallet after installation with the following command:
echo "run the wallet after installation with the following command: /usr/local/bin/bismuth"