function _testerrino() {
echo Successful hello there
}


function openAllURLs() {
    [ ! -f urls ] && return 1
    urls=$(cat urls | tr "\\n" " ")
    array=( ${=urls} )
    for i ("$array[@]");do
        firefox "$i"
        # xdg-open $i
    done
}

function bluedown() {
sudo systemctl disable bluetooth
sudo systemctl stop bluetooth
}

function tester() {
    fzf
}


function newbin() {
if [ $# -eq 1 ]; then
    if [ ! -f $1 ];then
        name=$1
    fi
else
    name="new-binary-from-$(date +%H-%M)"
fi
echo "#!/usr/bin/env zsh\necho Successful init" > $name
chmod +x $name || return 1
./$name
msleep 300
nvim $name
return 0
}


function addfig() {
    [ -d figures ] || mkdir figures
    cd figures
    wget $(xclip -o) || (echo failed && return 1)
    cd ..
    return 0
}

function screenshot(){
    [ ! -d $HOME/.screenshots ] && mkdir $HOME/.screenshots
    scrot -u -d 3 $HOME/.screenshots/screenshot-$(date +%H%M).png
}

function tomcon() {
    typeset -a arr
    arr=$(ls)
    for i in ( "$arr[@]" )

    }

function chgthm(){
cwd=$(pwd)
# dark="onedark"
# light="light"
echo $#
if [ $# -ne 1 ];then
    mode=$dark
else
    mode=$1
fi
echo Applying $mode mode

cd ~/.config/polybar
git checkout $mode
$HOME/.config/polybar/launch.sh &>/dev/null &
cd ~/.config/alacritty
git checkout $mode
cd $cwd
clear
}

function tglcolo (){
    grep onedark ~/.config/alacritty/colorscheme.toml &>/dev/null
    if [[ $? -eq 0 ]];then
        sed -i "s|onedark|alabaster|" ~/.config/alacritty/colorscheme.toml
    else
        sed -i "s|alabaster|onedark|" ~/.config/alacritty/colorscheme.toml
    fi
    touch ~/.config/alacritty/alacritty.toml
}
