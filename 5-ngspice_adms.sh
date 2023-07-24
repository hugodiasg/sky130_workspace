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

#wget -O ngspice-adms-va.7z https://sourceforge.net/projects/ngspice/files/ng-spice-rework/36/ngspice-adms-va.7z/download
wget -O ngspice-adms-va.7z https://sourceforge.net/projects/ngspice/files/ng-spice-rework/old-releases/38/ngspice-adms-va.7z/download
7za e ngspice-adms-va.7z  -aoa
./autogen.sh --adms
mkdir release
cd release
../configure --with-x --enable-xspice --disable-debug --enable-cider --with-readline=yes --enable-openmp
make -j4
sudo make install
cd ../..

