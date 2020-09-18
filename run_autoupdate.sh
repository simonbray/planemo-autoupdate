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

planemo clone https://github.com/lorrainealisha75/planemo_test.git
$HOME/.planemo/hub
cd planemo_test/
git branch
git checkout -b planemo-pr
git commit --allow-empty -m 'new test commit from planemo'
git push -u origin planemo-pr
planemo pull_request -m "planemo test pr"
