# decrypt the git credentials file
# --batch to prevent interactive command
# --yes to assume "yes" for questions
gpg --quiet --batch --yes --decrypt --passphrase "$PLANEMO_AUTOUPDATE_PASSPHRASE" --output $HOME/.planemo.yml .github/workflows/autoupdate-credentials.gpg
