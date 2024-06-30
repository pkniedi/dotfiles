# function to handle all cases

function notes() {
subject=$2


case $1 in 
    f)
        finishnotes
        ;;
    e)
        doexercises $subject
        ;;
    r)
      readnotes $subject
      ;;
    t)
      takenotes $subject
      ;;
    u)
      updateStandards $subject
      ;;
    i) 
      initDirsAndFiles $subject 
      ;;
  q) 
      tester
      ;;
  *) 
    printf "No valid option\n"
    ;; 
esac
}



# generate new notes entry

# goes to main directory of subject
function goToNotesDir() {

# check if exit status of grep is 0, if not, prompt to enter subject dir
if [ ! -f .notes-dir.md ]; then
    # Ask for which subject and then go there go into subject dir

    if [ $# -eq 1 ]; then
        input=$1
    else
        printf "Enter subject: "
        read input
    fi


    cd $HOME/notes/$input &> /dev/null

    while [[ $? -ne 0 ]];do
        printf " \"$1\" does not exist. Enter subject: "
        read input
        cd $HOME/notes/$input &> /dev/null
    done
fi
}


# Finishes all child processes and restores the prompt. If there is s git repo present, asks to enter a commit message
function finishnotes(){
pkill -P $$
cd $HOME
clear
}

tester(){
    echo in the test function
}

function takenotes(){
# Check if already in subject dir of some subject
updateStandards $1
goToNotesDir $1
openurls urls || printf " No links available\n"
msleep 500
subject=$(pwd | cut -d/ -f5)

cd notes
# latexmk -pdf -outdir=output -pvc main.tex  &>/dev/null & 
msleep 300

kitty --directory $HOME/notes/$subject/notes --hold latexmk -pdf -outdir=output -pvc --shell-escape main.tex &
msleep 300
i3-msg move container right &>/dev/null
zathura -P 0 output/main.pdf &>/dev/null &
msleep 300 
i3-msg focus left &>/dev/null

# automatically go to stopped sigh

grep "STOPPED" *.tex 2>/dev/null
if [ $? -eq 0 ]; then
    nvim -c /STOPPED $(grep "STOPPED:" *.tex 2>/dev/null | cut -d':' -f1) 
else
    nvim  main.tex
fi
}

# touches and creates dirs if they do notes alrady exist


function initDirsAndFiles() {
mkdir -p res/books res/slides res/papers notes exercises

# touch file in lectures dir
touch progress.md README.md urls
# touch exercises files
touch exercises/urls exercises/progress.md exercises/defaults
# touch files in res dir
touch res/defaults res/lectures.md res/urls
}

function updateStandards(){
    goToNotesDir $1
    initDirsAndFiles
    if [ -f .progress-log.md ]; then
       mv .progress-log.md progress.md 
    fi
    cd res
    if [ -f .tn-defaults.txt ]; then
        mv .tn-defaults.txt defaults
    fi
    if [ -f links ]; then
        mv links urls
    fi
    cd ..
    if [ -f links ]; then
        mv links urls
    fi

    if [ -d lectures ];then
        mv lectures/* ./res
        rm -rf lectures
    fi
return 0
}

function generatenotes() {
   initDirsAndFiles 
}

function doexercises() {
goToNotesDir $1
cd exercises
# [ -f urls ] && openurls urls
[ -f defaults ] && openDefs
}

function readnotes(){
goToNotesDir $1
cd res
# [ -f urls ] && openurls urls
[ -f defaults ] && openDefs
[ -f lectures.md ] && nvim lectures.md defaults urls
}


function openDefs() {
typeset -a def=("${(f)"$(<defaults)"}")
for lec in "${def[@]}";do
    # Check if line is not commented out.
    echo $lec | grep -E "^[^#][^ ].*"
    if [[ $? == 0 ]]; then
         zathura &>/dev/null $lec &
    fi
done
}
