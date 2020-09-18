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
git config --global hub.protocol https
git config --global user.email "lorrainealisha75@gmail.com"
git config --global user.name "lorrainealisha75"
export GITHUB_TOKEN="$GITHUB_TOKEN"

rm -rf gxwf
planemo clone https://github.com/simonbray/gxwf.git
/usr/local/bin/hub
cd gxwf/
git branch
git checkout -b planemo-pr
git commit --allow-empty -m 'new test commit from planemo'
git push -u origin planemo-pr
planemo pull_request -m "planemo test pr"
