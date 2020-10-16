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
git remote rm godot-fire || true
git remote add godot-fire https://github.com/godot-extended-libraries/godot-fire
git remote set-url --push godot-fire https://example.com/
git fetch godot-fire
git remote rm godotengine || true
git remote add godotengine https://github.com/godotengine/godot
git remote set-url --push godotengine https://example.com/
git fetch godotengine
git remote rm v-sekai-godot || true
git remote add v-sekai-godot git@github.com:v-sekai/godot.git
git remote set-url --push v-sekai-godot https://example.com/
git fetch v-sekai-godot
git remote rm TwistedTwigleg || true
git remote add TwistedTwigleg https://github.com/TwistedTwigleg/godot.git
git remote set-url --push TwistedTwigleg https://example.com/
git fetch TwistedTwigleg
git remote rm JFonS || true
git remote add JFonS https://github.com/JFonS/godot.git
git remote set-url --push JFonS https://example.com/
git fetch JFonS

echo -e "Work"
git stash
git checkout merge-script-master --force
git branch -D groups || true
python3 ./thirdparty/git-assembler -av
git checkout groups -f
export MERGE_DATE=$(date --iso=sec --utc)
export MERGE_TAG=$(echo v-sekai.$MERGE_DATE | tr ':' ' ' | tr -d ' \t\n\r')
git tag -a $MERGE_TAG -m "Commited at $MERGE_DATE."
git push remotes/v-sekai-godot $MERGE_TAG
git merge -s ours remotes/v-sekai-godot/groups
git push -f remotes/v-sekai-godot/groups
git checkout merge-script-master -f
