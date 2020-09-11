echo "Starting autoupdate..."
pip3 install wheel
sudo pip3 install virtualenv
virtualenv .au
source .au/bin/activate
# pip install conda
pip install https://github.com/simonbray/planemo/archive/autoupdate-sb.zip  # install from my fork for now
pip install -e planemo/
planemo --help

# git credentials
git config --global user.email "lorrainealisha75@gmail.com"
git config --global user.name "lorrainealisha75"

echo "github:" > $HOME/.planemo.yml
echo "	username: lorrainealisha75" >> $HOME/.planemo.yml
echo "	password: 6a4aaf73fa0e937de06b35d92810f7d7b64d3b25" >> $HOME/.planemo.yml

planemo clone https://github.com/lorrainealisha75/planemo.git
cd planemo/
git branch
git checkout -b planemo-test
git commit --allow-empty -m 'new test commit from planemo'
git push -u origin planemo-test
planemo pull_request -m "planemo test pr"
