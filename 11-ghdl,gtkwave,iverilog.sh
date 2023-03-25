# GHDL
sudo apt install gnat -y
git clone https://github.com/ghdl/ghdl
cd ghdl/
./configure --enable-synth
make
sudo make install
cd ..

#GTKWave

sudo apt install libbz2-dev -y
git clone https://github.com/gtkwave/gtkwave
cd gtkwave/gtkwave3-gtk3/
./autogen.sh
./configure --enable-gtk3
make
sudo make install
cd ../..

# Yosys
sudo apt-get install build-essential clang bison flex \
	libreadline-dev gawk tcl-dev libffi-dev git \
	graphviz xdot pkg-config python3 libboost-system-dev \
	libboost-python-dev libboost-filesystem-dev zlib1g-dev -y
	
git clone https://github.com/YosysHQ/yosys
cd yosys
make config-clang
make config-gcc
make 
sudo make install
cd ..

# Icarus Verilog
sudo apt-get install verilog

# GHDL Yosys plugin
#sudo apt install yosys-dev yosys -y

git clone https://github.com/ghdl/ghdl-yosys-plugin
cd ghdl-yosys-plugin/
make
cd ..

# if has problems with ghdl.so

sudo rm /usr/local/bin/../share/yosys/plugins/ghdl.so
sudo mkdir /usr/local/bin/../share/yosys/plugins/
sudo cp /home/$(whoami)/sky130_workspace/ghdl-yosys-plugin/ghdl.so /usr/local/bin/../share/yosys/plugins/ghdl.so
sudo chmod 777 /usr/local/bin/../share/yosys/plugins/ghdl.so

