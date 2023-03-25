echo "Install Klayout sky130 tech"
if [ ! -d ~/.klayout ]; then
  # Create the directory
  mkdir ~/.klayout
fi
cd ~/.klayout
mkdir tech
cd tech
git clone https://github.com/mabrains/sky130_klayout_pdk.git sky130
pip install pandas
cd ~/sky130_workspace
echo "END"
