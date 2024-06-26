# docs: https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html#Prompt-Expansion
# include time using strfime https://strftime.org/

#        
SIGN="%F{$RED}%f%F{$GREEN}%f%F{$YELLOW}%f"
SIGN="$"
ERR_SIGN=$SIGN
DARK_GREY="#3b3e44"
LIGHT_GREY="#a8b0c1"
GREY="#7a808e"



FANCY_R="%0(?..%F{red} %?%f) %1(j.%F{green}%j%f.%F{$DARK_GREY}0%f)"
FANCY_L="%F{green}%n%f@%F{red}%m%f:%F{blue}%1.%f %F{yellow}$SIGN%f "
RIGHT_PROMPT="%F{green}%n@%m%f:%F{blue}%1.%f %0(?..%F{red}%? %f)%1(j.%F{green}%j%f .)%F{yellow}$SIGN%f "
export STD_PROMPTL="[%F{yellow}%2~%f] %B$SIGN%b "
PROMPT=$RIGHT_PROMPT
