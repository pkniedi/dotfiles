files=("functions.sh" "prompt.sh" "notes.sh" "aliases.sh" "utils.sh" "widges.sh")


for i in "${files[@]}"
do
    # printf "source $i "
    source $ZDOTDIR/$i
    # printf "done!\n"
done
