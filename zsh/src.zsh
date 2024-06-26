files=("funcs.zsh" "prompt.zsh" "notes.zsh" "aliases.zsh" "utils.zsh" "widges.zsh" )

for i in "${files[@]}" 
do
    source $ZDOTDIR/$i
done
