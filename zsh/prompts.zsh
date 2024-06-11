# docs: https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html#Prompt-Expansion
# include time using strfime https://strftime.org/

#        
SIGN="  "
ERR_SIGN=$SIGN
DARK_GREY="#3b3e44"
LIGHT_GREY="#a8b0c1"
GREY="#7a808e"


SIGN="%F{$RED}%f%F{$GREEN}%f%F{$YELLOW}%f"

FANCY_R="%0(?..%F{red} %?%f) %1(j.%F{green}%j%f.%F{$DARK_GREY}0%f)"
FANCY_L="[%F{blue}%n%f@%F{yellow}%m%f] (%1.) %B$SIGN%b "
export STD_PROMPTL="[%F{yellow}%2~%f] %B$SIGN%b "
