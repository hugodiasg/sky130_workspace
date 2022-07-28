echo "Download and install Xschem"
git clone https://github.com/StefanSchippers/xschem
cd xschem/
./configure
make 
sudo make install
cd ..

# libs sky130 to xschem
echo "libs sky130 to xschem"
cd /home/$(whoami)/.xschem/simulations/
cp /home/$(whoami)/sky130_workspace/utilities/.spiceinit .spiceinit
cd ..
mkdir xschem_library
cd xschem_library/
git clone https://github.com/StefanSchippers/xschem_sky130
cd /home/$(whoami)/sky130_workspace/
ln -s /home/$(whoami)/.xschem/xschem_library/xschem_sky130
ln -s /home/$(whoami)/sky130_workspace/skywater-pdk/libraries/sky130_fd_pr /usr/local/share/pdk/sky130A/libs.ref


# config pdk to xschem and ngspice
echo "Config pdk to xschem and ngspice"
*cd /home/$(whoami)/sky130_workspace/skywater-pdk/libraries
*cp -a sky130_fd_pr sky130_fd_pr_ngspice
*cd sky130_fd_pr_ngspice/latest/
*patch -p2 </home/$(whoami)/.xschem/xschem_library/xschem_sky130/sky130_fd_pr.patch
*cd ../../../..
