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

# decrypt the git credentials file
# --batch to prevent interactive command
# --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase "$PLANEMO_AUTOUPDATE_PASSPHRASE" --output $HOME/.planemo.yml autoupdate-credentials.gpg

# Test if the file with github credentials has been decrypted correctly. Will be removed once confirmed.
cat $HOME/.planemo.yml

planemo clone https://github.com/lorrainealisha75/planemo.git
cd planemo/
git branch
git checkout -b planemo-pr
git commit --allow-empty -m 'new test commit from planemo'
git push -u origin planemo-pr
planemo pull_request -m "planemo test pr"
