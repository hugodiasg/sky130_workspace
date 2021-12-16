## Install xschem + xschem_sky130 + skywater-pdk + ngspice +adms 
echo  Install xschem + xschem_sky130 + skywater-pdk + ngspice +adms 

#solve dependencies
echo solve dependencies
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install gcc gcc-c++ autoconf automake patch patchutils indent libtool python3 cmake git -y
sudo apt-get install make libx11-6 libx11-dev libxrender1 libxrender-dev libxcb1 libx11-xcb-dev libcairo2 libcairo2-dev tcl8.6 tcl8.6-dev tk8.6 tk8.6-dev flex bison libxpm4 libxpm-dev gawk m4 -y
sudo apt-get install m4 tcsh csh libx11-dev tcl-dev tk-dev libcairo2-dev libncurses-dev libglu1-mesa-dev freeglut3-dev mesa-common-dev -y
sudo apt-get install gcc autoconf automake patch patchutils indent libtool python3 cmake git -y
sudo apt install build-essential -y
sudo apt-get install build-essential -y
sudo apt-get install automake libtool gperf flex bison -y
sudo apt-get install libxml2 libxml2-dev -y
sudo apt-get install libxml-libxml-perl -y
sudo apt-get install libgd-perl -y
sudo apt-get install p7zip -y
sudo apt-get install adms -y
sudo apt-get install libxaw7-dev -y
sudo apt-get install libreadline-dev libreadline8 -y


# download and install Xschem
echo Download and install Xschem
git clone https://github.com/StefanSchippers/xschem
cd xschem/
./configure
make -j4
sudo make install
cd

# libs sky130 to xschem
echo libs sky130 to xschem
cd /home/$(whoami)/.xschem
mkdir xschem_library
cd xschem_library/
git clone https://github.com/StefanSchippers/xschem_sky130
cd  /home/$(whoami)/sky130_workspace/
ln -s /home/$(whoami)/.xschem/xschem_library/xschem_sky130

# download skywater pdk
echo download skywater pdk
git clone https://github.com/google/skywater-pdk
cd skywater-pdk

# initialise pdk
echo initialise pdk
git submodule init libraries/sky130_fd_pr/latest libraries/sky130_fd_sc_hd/latest libraries/sky130_fd_sc_hdll/latest libraries/sky130_fd_sc_hs/latest libraries/sky130_fd_sc_ms/latest libraries/sky130_fd_sc_ls/latest libraries/sky130_fd_sc_lp/latest  libraries/sky130_fd_sc_hvl/latest
git submodule update
sudo make timing

# config pdk to xschem and ngspice
echo Config pdk to xschem and ngspice
cd libraries
cp -a sky130_fd_pr sky130_fd_pr_ngspice
cd sky130_fd_pr_ngspice/latest/
patch -p2 </home/$(whoami)/.xschem/xschem_library/xschem_sky130/sky130_fd_pr.patch
cd ../..

#download and install Ngspice with adms
echo Download and install Ngspice with adms
git clone git://git.code.sf.net/p/ngspice/ngspice
cd ngspice/
git checkout pre-master
git clone https://github.com/Qucs/ADMS
cd ..
## amds
echo ADMS
git clone https://github.com/Qucs/ADMS
cd ADMS/
sh bootstrap.sh
./configure
sudo make install
cd ..

# amds suport 
echo ADMS suport
cd ngspice/
wget -O ng_adms_va.tar.gz https://sourceforge.net/projects/ngspice/files/ng-spice-rework/35/ngspice-adms-va.7z/download
7za e ngspice-adms-va.7z  -aoa
mkdir release
cd release
../configure --with-x --enable-xspice --disable-debug --enable-cider --with-readline=yes --enable-openmp
make -j4
sudo make install

cd ../..
echo End!!
