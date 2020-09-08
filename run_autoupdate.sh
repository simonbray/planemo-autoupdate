echo "Starting autoupdate..."
pip3 install wheel
sudo apt install python3-virtualenv
virtualenv .au
source .au/bin/activate
pip install conda
pip install https://github.com/simonbray/planemo/archive/autoupdate-sb.zip  # install from my fork for now
planemo --help

# git credentials
git config --global user.email "sbray1371@gmail.com"
git config --global user.name "Simon Bray"

## start updating bgruening repo
#git clone git@github.com:bgruening/galaxytools.git
#cd galaxytools
#planemo autoupdate -r
#git diff

# test make commit
git clone git@github.com:simonbray/gxwf.git
git commit --allow-empty -m 'test commit with github actions'
git push
