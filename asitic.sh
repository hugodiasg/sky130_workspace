#Download and install ASITIC
mkdir asitic
cd asitic/
wget http://rfic.eecs.berkeley.edu/~niknejad/Asitic/grackle/doc_05_28_01.tgz
wget http://rfic.eecs.berkeley.edu/~niknejad/Asitic/grackle/asitic_linux.gz
wget http://rfic.eecs.berkeley.edu/~niknejad/Asitic/3.19.00/common.tgz

gzip -d asitic_linux.gz
gzip -d common.tgz
gzip -d doc_05_28_01.tgz
tar -xvf common.tar
tar -xvf doc_05_28_01.tar
rm common.tar doc_05_28_01.tar
chmod 777 asitic_linux

## if asitic_linux is not a dynamic executable
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 -y
## end if
sudo apt-get install libxtst6:i386 -y
wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-3.4/libg2c0_3.4.6-6ubuntu5_i386.deb
sudo dpkg -i --force-all libg2c0_3.4.6-6ubuntu5_i386.deb

# sky130 tek to Asitic
rm libg2c0_3.4.6-6ubuntu5_i386.deb
wget https://raw.githubusercontent.com/yrrapt/inductor-generator/main/asitic/sky130.tek

## copiar o asitic_sky130 para a pasta asitic
chmod 777 asitic_sky130
