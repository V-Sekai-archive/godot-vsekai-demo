set -e

git stash

echo -e "Checkout remotes"
git remote rm SaracenOne || true
git remote add SaracenOne https://github.com/SaracenOne/godot
git remote set-url --push SaracenOne https://example.com/
git fetch SaracenOne
git remote rm lyuma || true
git remote add lyuma https://github.com/lyuma/godot
git remote set-url --push lyuma https://example.com/
git fetch lyuma
git remote rm godot-extended-libraries-godot-fire || true
git remote add godot-extended-libraries-godot-fire https://github.com/godot-extended-libraries/godot-fire
git remote set-url --push godot-fire https://example.com/
git fetch godot-extended-libraries-godot-fire
git remote rm fire || true
git remote add fire https://github.com/fire/godot
git remote set-url --push fire https://example.com/
git fetch fire
git remote rm godotengine || true
git remote add godotengine https://github.com/godotengine/godot
git remote set-url --push godotengine https://example.com/
git fetch godotengine
git remote rm v-sekai-godot || true
git remote add v-sekai-godot git@github.com:V-Sekai/godot.git
# Need permission to push
#git remote set-url --push v-sekai-godot https://example.com/
git fetch v-sekai-godot
git remote rm TwistedTwigleg || true
git remote add TwistedTwigleg https://github.com/TwistedTwigleg/godot.git
git remote set-url --push TwistedTwigleg https://example.com/
git fetch TwistedTwigleg
git remote rm JFonS || true
git remote add JFonS https://github.com/JFonS/godot.git
git remote set-url --push JFonS https://example.com/
git fetch JFonS
git remote rm Xrayez || true
git remote add Xrayez https://github.com/Xrayez/godot.git
git remote set-url --push Xrayez https://example.com/
git fetch Xrayez
git remote rm YeldhamDev || true
git remote add YeldhamDev https://github.com/YeldhamDev/godot.git
git remote set-url --push YeldhamDev https://example.com/
git fetch YeldhamDev

echo -e "Work"
git stash
export ORIGINAL_BRANCH=merge-script-4.x
export MERGE_REMOTE=v-sekai-godot
export MERGE_BRANCH=groups-4.x
git checkout $ORIGINAL_BRANCH --force
git branch -D $MERGE_BRANCH || true
python3 ./thirdparty/git-assembler -av --recreate
git checkout $MERGE_BRANCH -f
export MERGE_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
export MERGE_TAG=$(echo groups-4.x.$MERGE_DATE | tr ':' ' ' | tr -d ' \t\n\r')
git tag -a $MERGE_TAG -m "Commited at $MERGE_DATE."
git push $MERGE_REMOTE $MERGE_TAG
git push $MERGE_REMOTE $MERGE_BRANCH -f
git checkout $ORIGINAL_BRANCH --force
git branch -D $MERGE_BRANCH || true