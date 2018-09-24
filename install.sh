proj_dir=$(git rev-parse --show-toplevel)

echo "$proj_dir"

cp -r $proj_dir/. ~/ --exclude install.sh
