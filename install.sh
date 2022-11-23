#!/usr/bin/env bash
cd $HOME
sudo wget https://github.com/Evisom/newlatexdoc/archive/refs/heads/master.zip
sudo unzip master.zip
sudo rm master.zip
sudo cp -R newlatexdoc-master newlatexdoc
sudo rm -rf newlatexdoc-master
sudo chmod +x newlatexdoc/newlatexdoc.sh
sudo ln  newlatexdoc/newlatexdoc.sh /usr/local/bin/newlatexdoc
sudo mv /usr/local/bin/newlatexdoc.sh /user/local/bin/newlatexdoc
newlatexdoc help