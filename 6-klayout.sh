echo "Install Klayout sky130 tech"
cd
cd .klayout
mkdir tech
cd tech
git clone https://github.com/mabrains/sky130_klayout_pdk.git sky130
pip install pandas
cd
cd sky130_workspace
echo "END"
