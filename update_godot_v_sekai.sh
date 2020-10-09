set -e

echo -e "Checkout remotes"
git remote rm SaracenOne
git remote add SaracenOne https://github.com/SaracenOne/godot
git fetch SaracenOne
git remote rm lyuma || true
git remote add lyuma https://github.com/lyuma/godot
git fetch lyuma
git remote rm godot-fire || true
git remote add godot-fire https://github.com/godot-extended-libraries/godot-fire
git fetch godot-fire
git remote rm godotengine
git remote add godotengine https://github.com/godotengine/godot
git fetch godotengine
git remote rm v-sekai-godot || true
git remote add v-sekai-godot git@github.com:v-sekai/godot.git
git fetch v-sekai-godot

echo -e "Work"
git checkout master --force
git branch -D groups || true
python3 ./thirdparty/git-assembler -av
git checkout groups -f
git push -u -f v-sekai-godot groups
git checkout master -f
