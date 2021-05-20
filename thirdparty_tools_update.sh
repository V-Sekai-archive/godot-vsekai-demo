mkdir -p thirdparty
curl -L https://gitlab.com/wavexx/git-assembler/-/raw/master/git-assembler -o ./thirdparty/git-assembler
chmod +x ./thirdparty/git-assembler
# RERERE is banned
# git config rerere.enabled true