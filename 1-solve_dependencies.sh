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
sudo apt-get install p7zip-full -y
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
sudo apt-get install gedit -y
sudo apt install python3-pip klayout -y
