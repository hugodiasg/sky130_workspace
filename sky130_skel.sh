## Install xschem + xschem_sky130 + skywater-pdk + ngspice +adms 
echo  "Install xschem + xschem_sky130 + skywater-pdk + ngspice +adms + asitic +  magic + klayout + open-pdk + gedit-SPICE-highlight"

#solve dependencies
echo "solve dependencies"
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install gcc autoconf automake patch patchutils indent libtool python3 cmake git -y
sudo apt-get install make libx11-6 libx11-dev libxrender1 libxrender-dev libxcb1 libx11-xcb-dev libcairo2 libcairo2-dev tcl8.6 tcl8.6-dev tk8.6 tk8.6-dev flex bison libxpm4 libxpm-dev gawk m4 -y
sudo apt-get install m4 tcsh csh libx11-dev tcl-dev tk-dev libcairo2-dev libncurses-dev libglu1-mesa-dev freeglut3-dev mesa-common-dev -y
sudo apt-get install gcc autoconf automake patch patchutils indent libtool python3 cmake git -y
sudo apt-get install build-essential -y
sudo apt-get install automake libtool gperf flex bison -y
sudo apt-get install libxml2 libxml2-dev -y
sudo apt-get install libxml-libxml-perl -y
sudo apt-get install libgd-perl -y
sudo apt-get install p7zip -y
sudo apt-get install adms -y
sudo apt-get install libxaw7-dev -y
sudo apt-get install libreadline-dev libreadline8 -y
sudo apt install p7zip-full
#Asitic
sudo apt-get install gcc-multilib
sudo apt-get install libxtst6:i386
#klayout
sudo apt-get install qt5-default -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt-get update
sudo apt-get install python3.8 -y
sudo apt-get install python3.8-dev -y
sudo apt-get install libqt5xmlpatterns5-dev -y
sudo apt-get install qttools5-dev -y
sudo apt-get install qtmultimedia5-dev libqt5multimediawidgets5 -y
sudo apt-get install libqt5svg5* -y
sudo apt-get install libqt5svg5-dev -y

# download skywater pdk
echo "Download skywater pdk"
git clone https://github.com/google/skywater-pdk
cd skywater-pdk

# initialise pdk
echo "initialise pdk"
git submodule init libraries/sky130_fd_pr/latest libraries/sky130_fd_sc_hd/latest libraries/sky130_fd_sc_hdll/latest libraries/sky130_fd_sc_hs/latest libraries/sky130_fd_sc_ms/latest libraries/sky130_fd_sc_ls/latest libraries/sky130_fd_sc_lp/latest  libraries/sky130_fd_sc_hvl/latest
sudo git submodule update && sudo make timing

echo "Download and install magic"
# download
git clone https://github.com/RTimothyEdwards/magic.git
cd magic
#git checkout magic-8.3
# compile & install
sudo ./configure
sudo make
sudo make install
cd ..
#download the open pdk
git clone https://github.com/RTimothyEdwards/open_pdks
cd open_pdks
#git checkout open_pdks-1.0
sudo ./configure --enable-sky130-pdk=/home/$(whoami)/sky130_workspace/skywater-pdk/libraries
sudo make
sudo make install
cd ../..
sudo ln -s /home/hugodg/sky130_workspace/open_pdks/sky130/sky130A/libs.tech/magic/* /usr/local/lib/magic/sys/

# download and install Xschem
echo "Download and install Xschem"
git clone https://github.com/StefanSchippers/xschem
cd xschem/
./configure
make -j4
sudo make install
cd ..

# libs sky130 to xschem
echo "libs sky130 to xschem"
cd /home/$(whoami)/.xschem/simulations
cp /home/$(whoami)/sky130_workspace/utilities/.spiceinit .spiceinit
cd ..
mkdir xschem_library
cd xschem_library/
git clone https://github.com/StefanSchippers/xschem_sky130
cd /home/$(whoami)/sky130_workspace/
ln -s /home/$(whoami)/.xschem/xschem_library/xschem_sky130

# config pdk to xschem and ngspice
echo "Config pdk to xschem and ngspice"
cd skywater-pdk/libraries
cp -a sky130_fd_pr sky130_fd_pr_ngspice
cd sky130_fd_pr_ngspice/latest/
patch -p2 </home/$(whoami)/.xschem/xschem_library/xschem_sky130/sky130_fd_pr.patch
cd ../../../..

#download and install Ngspice with adms
echo "Download and install Ngspice with adms"
git clone git://git.code.sf.net/p/ngspice/ngspice
cd ngspice/
git checkout pre-master

## amds
echo "ADMS"
git clone https://github.com/Qucs/ADMS
cd ADMS/
sh bootstrap.sh
./configure
sudo make install
cd ..

# amds suport 
echo "ngspice - ADMS suport"

wget -O ngspice-adms-va.7z https://sourceforge.net/projects/ngspice/files/ng-spice-rework/36/ngspice-adms-va.7z/download
7za e ngspice-adms-va.7z  -aoa
./autogen.sh --adms
mkdir release
cd release
../configure --with-x --enable-xspice --disable-debug --enable-cider --with-readline=yes --enable-openmp
make -j4
sudo make install
cd ../..

#ASITIC
echo "Install ASITIC"
mkdir asitic
cd asitic
wget http://rfic.eecs.berkeley.edu/~niknejad/Asitic/grackle/asitic_linux.gz
wget http://rfic.eecs.berkeley.edu/~niknejad/Asitic/grackle/doc_05_28_01.tgz
wget http://rfic.eecs.berkeley.edu/~niknejad/Asitic/3.19.00/common.tgz

gzip -d asitic_linux.gz
tar -xvzf doc_05_28_01.tgz 
tar -xvzf common.tgz 

chmod +x asitic_linux

wget http://old-releases.ubuntu.com/ubuntu/pool/universe/g/gcc-3.4/libg2c0_3.4.6-6ubuntu5_i386.deb
sudo dpkg -i --force-all libg2c0_3.4.6-6ubuntu5_i386.deb

echo "Downloading ASITIC .tek file from yrrapt@github repository..."
wget https://raw.githubusercontent.com/yrrapt/inductor-generator/main/asitic/sky130.tek


echo "asitic_sky130"
cp /home/$(whoami)/sky130_workspace/utilities/asitic_sky130 asitic_sky130
chmod +x asitic_sky130

cd ..

echo "Gedit-SPICE-syntax-highlighting"
cd utilities 
sudo cp spice.lang /usr/share/gtksourceview-4/language-specs/spice.lang
cd ..

echo "Install Klayout"
sudo apt-get install klayout

echo "Now, install the sky130 tech to klayout on:"
echo "https://github.com/britovski/sky130_klayout_pdk"

echo "Netgen"
git clone https://github.com/RTimothyEdwards/netgen
cd netgen/
./configure 
sudo make
sudo make install
cd ..
echo "End"
