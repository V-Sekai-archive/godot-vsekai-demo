set -e

echo -e "Checkout remotes"
git remote rm SaracenOne || true
git remote add SaracenOne https://github.com/SaracenOne/godot
git fetch SaracenOne
git remote rm lyuma || true
git remote add lyuma https://github.com/lyuma/godot
git fetch lyuma
git remote rm godot-fire || true
git remote add godot-fire https://github.com/godot-extended-libraries/godot-fire
git fetch godot-fire
git remote rm godotengine || true
git remote add godotengine https://github.com/godotengine/godot
git fetch godotengine
git remote rm v-sekai-godot || true
git remote add v-sekai-godot git@github.com:v-sekai/godot.git
git fetch v-sekai-godot
git remote rm TwistedTwigleg || true
git remote add TwistedTwigleg https://github.com/TwistedTwigleg/godot.git
git fetch TwistedTwigleg
git remote rm JFonS || true
git remote add JFonS https://github.com/JFonS/godot.git
git fetch JFonS

echo -e "Work"
git stash
git checkout master --force
git branch -D groups || true
python3 ./thirdparty/git-assembler -av
git checkout groups -f
export MERGE_DATE=$(date --iso=sec --utc)
export MERGE_TAG=$(echo v-sekai.$MERGE_DATE | tr ':' ' ' | tr -d ' \t\n\r')
git tag -a $MERGE_TAG -m "Commited at $MERGE_DATE."
git push v-sekai-godot $MERGE_TAG
git push -u -f v-sekai-godot groups
git checkout master -f
