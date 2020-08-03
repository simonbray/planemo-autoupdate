echo "Starting autoupdate..."
pip install wheel
pip install virtualenv
virtualenv .au
source .au/bin/activate
pip install https://github.com/simonbray/planemo/archive/autoupdate-sb.zip  # install from my fork for now
planemo --help

# start updating bgruening repo
git clone https://github.com/bgruening/galaxytools.git
cd galaxytools
planemo autoupdate -r
git diff
