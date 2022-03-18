echo "Install Klayout sky130 tech"
cd /home/$(whoami)/.klayout
mkdir tech
cd tech
git clone https://github.com/mabrains/sky130_klayout_pdk.git sky130
pip install pandas
echo "END"
