set -e

git stash

echo -e "Checkout remotes"
git remote rm godot-fire || true
git remote add godot-fire https://github.com/godot-extended-libraries/godot-fire
git remote set-url --push godot-fire https://example.com/
git fetch godot-fire
git remote rm fire || true
git remote add fire https://github.com/fire/godot
git remote set-url --push fire https://example.com/
git fetch fire
git remote rm godotengine || true
git remote add godotengine https://github.com/godotengine/godot
git remote set-url --push godotengine https://example.com/
git fetch godotengine
git remote rm v-sekai-godot || true
git remote add v-sekai-godot git@github.com:v-sekai/godot.git
# Need permission to push
#git remote set-url --push v-sekai-godot https://example.com/
git fetch v-sekai-godot

echo -e "Work"
git stash
export ORIGINAL_BRANCH=main
export MERGE_REMOTE=v-sekai-godot
export MERGE_BRANCH=godot-3.4
git checkout $ORIGINAL_BRANCH --force
git branch -D $MERGE_BRANCH || true
python3 ./thirdparty/git-assembler -av --recreate
git checkout $MERGE_BRANCH -f
export MERGE_DATE=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
export MERGE_TAG=$(echo groups.$MERGE_DATE | tr ':' ' ' | tr -d ' \t\n\r')
git tag -a $MERGE_TAG -m "Commited at $MERGE_DATE."
git push $MERGE_REMOTE $MERGE_TAG
git push $MERGE_REMOTE $MERGE_BRANCH -f
git checkout $ORIGINAL_BRANCH --force
git branch -D $MERGE_BRANCH || true