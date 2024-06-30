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



function remind () {
  local COUNT="$#"
  local COMMAND="$1"
  local MESSAGE="$1"
  local OP="$2"
  shift 2
  local WHEN="$@"
  # Display help if no parameters or help command
  if [[ $COUNT -eq 0 || "$COMMAND" == "help" || "$COMMAND" == "--help" || "$COMMAND" == "-h" ]]; then
    echo "COMMAND"
    echo "    remind <message> <time>"
    echo "    remind <command>"
    echo
    echo "DESCRIPTION"
    echo "    Displays notification at specified time"
    echo
    echo "EXAMPLES"
    echo '    remind "Hi there" now'
    echo '    remind "Time to wake up" in 5 minutes'
    echo '    remind "Dinner" in 1 hour'
    echo '    remind "Take a break" at noon'
    echo '    remind "Are you ready?" at 13:00'
    echo '    remind list'
    echo '    remind clear'
    echo '    remind help'
    echo
    return
  fi
  # Check presence of AT command
  if ! which at >/dev/null; then
    echo "remind: AT utility is required but not installed on your system. Install it with your package manager of choice, for example 'sudo apt install at'."
    return
  fi
  # Run commands: list, clear
  if [[ $COUNT -eq 1 ]]; then
    if [[ "$COMMAND" == "list" ]]; then
      at -l
    elif [[ "$COMMAND" == "clear" ]]; then
      at -r $(atq | cut -f1)
    else
      echo "remind: unknown command $COMMAND. Type 'remind' without any parameters to see syntax."
    fi
    return
  fi
  # Determine time of notification
  if [[ "$OP" == "in" ]]; then
    local TIME="now + $WHEN"
  elif [[ "$OP" == "at" ]]; then
    local TIME="$WHEN"
  elif [[ "$OP" == "now" ]]; then
    local TIME="now"
  else
    echo "remind: invalid time operator $OP"
    return
  fi
  # Schedule the notification
  echo "notify-send  'REMINDER' '$MESSAGE'" | at $TIME
  echo "Notification scheduled at $TIME"
}
