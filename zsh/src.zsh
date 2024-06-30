files=("functions.zsh" "prompt.zsh" "notes.zsh" "aliases.zsh" "utils.zsh" "widges.zsh" )

for i in "${files[@]}" 
do
    printf "source $i "
    source $ZDOTDIR/$i
    printf "done!\n"
done
