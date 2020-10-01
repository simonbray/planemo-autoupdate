echo "Starting autoupdate..."
pip3 install wheel
sudo pip3 install virtualenv
virtualenv .au
source .au/bin/activate

#Install latest hub
echo "Install hub"
brew install hub
echo "hub install successful"

# pip install conda
pip install https://github.com/simonbray/planemo/archive/autoupdate-sb.zip  # install from my fork for now
pip install -e planemo/
planemo --help

# git credentials
git config --global user.email "lorrainealisha75@gmail.com"
git config --global user.name "Lorraine Coelho"

rm -rf galaxytools
planemo clone --skip_fork --branch planemo-pr-93-`date +%F-%H-%m` git@github.com:lorrainealisha75/galaxytools
echo "Cloning successful"
cd galaxytools/
echo "Folder is:"
pwd
echo "Commit"
git commit --allow-empty -m 'new test commit from planemo'
echo "Git pull origin master"
git pull origin master
echo "Push"
git push -u origin planemo-pr-93-`date +%F-%H-%m`
echo "Create pull request"
planemo pull_request -m "planemo test pr 11"
