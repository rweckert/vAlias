#!/bin/bash
# vAlias.sh Created: 03/23/2025 Updated: 04/20/2025
# Robert W. Eckert - rweckert@gmail.com
#         _____  .__  .__               
# ___  __/  _  \ |  | |__|____    ______
# \  \/ /  /_\  \|  | |  \__  \  /  ___/
#  \   /    |    \  |_|  |/ __ \_\___ \ 
#   \_/\____|__  /____/__(____  /____  )
#              \/             \/     \/ v:1.0
# A simple alias viewing and backup utility.

fcall="export -f"
bcall="bash -c"
afp=$(dirname "$(realpath "$0")")
export app="$afp/vAlias.sh"
export td="/tmp"
export tf="$td/vAlias.txt"
export ti="$td/vAlias.ini"
export tt="$td/vAlias.tmp"

# Main Menu: ===========================
function mMenu {
yad --form --css="$tp" --posx=20 --posy=20 --width=300 --fixed --title="vAlias-Menu" --name="mMenu" --window-icon="text-x-script" --f1-action="$app mHelp" --no-buttons --columns=10 \
--field="View Alias":fbtn "$bcall aView" \
--field="Refresh":fbtn "$bcall rView" \
--field="Terminal":fbtn "$bcall lTerminal" \
--field="Settings":fbtn "$bcall mSettings" \
--field="Theme":fbtn "$bcall mTheme" \
--field="Help":fbtn "$bcall mHelp" \
--field="Exit":fbtn "$bcall mExit" 2> /dev/null
}
$fcall mMenu

# Alias View: ==========================
function aView {
cat ~/.bash_aliases > "$tf"
wait
sed -i 's/alias //g' "$tf"
sed -i 's/\=/\n/g' "$tf"
dv='@sh -c "echo %s > $tt & $app dView"'
ydo=$(yad --list --css="$tp" --posx=20 --posy=115 --height=550 --title="vAlias-View" --name="aView" --window-icon="text-x-script" --dclick-action="$dv" --button="Backup":5 --button="Save As":4 --button="Edit Copy":3 --button="Help":2 --button="Close":1 --column="Alias Name:text" --column="Alias Command:text" < "$tf" 2> /dev/null)
ydo=$?
if [ $ydo -eq 1 ]; then
wmctrl -c 'Alias-View'
fi
if [ $ydo -eq 2 ]; then
mHelp
aView
fi
if [ $ydo -eq 3 ]; then
cat ~/.bash_aliases > "$tt"
xdg-open "$tt"
aView
fi
if [ $ydo -eq 4 ]; then
sf=$(yad --file --save --center)
cp -f ~/.bash_aliases "$sf"
aView
fi
if [ $ydo -eq 5 ]; then
sd=$(yad --file --directory --center)
ts=$(date '+%m-%d-%Y-%H-%M-%S');
zip -j $sd/alias-$ts.zip ~/.bash_aliases
yad --text="The file ~/.bash_aliases has been backed up successfully:\n$sd/alias-$ts.zip" --css="$tp" --title="Saved" --center --text-align=left --fixed --on-top --window-icon="text-x-script" --button="OK":0
aView
fi
}
$fcall aView

# Detail View: =========================
function dView {
read gdv < "$tt"
ua="'"
gan=$(awk -F"'" '{print $1}' <<< "$gdv")
gac=$(awk -F"'" '{print $2}' <<< "$gdv")
dc='@sh -c "echo alias $2=%3 > $tt & $app dCopy"'
yad --form --css="$tp" --posx=40 --posy=135 --width=300 --fixed --title="vAlias-Detail" --name="dView" --window-icon="text-x-script" --f1-action="$app mHelp" --no-buttons --columns=1 \
--field="View Alias Command:":lbl "" \
--field="Name" "$gan" \
--field="Command" "'$gac'" \
--field="Copy Alias":fbtn "$dc" \
--field="Close Detail":fbtn "wmctrl -c 'vAlias-Detail'" 2> /dev/null
}
$fcall dView

# Copy Detail: =========================
function dCopy {
read gdc < "$tt"
echo -n "$gdc" | xclip -selection clipboard
yad --text="Command has beed copied to the system clipboard." --css="$tp" --title="Saved" --center --text-align=left --fixed --on-top --window-icon="text-x-script" --button="OK":0
wmctrl -c 'vAlias-Detail'
rView
}
$fcall dCopy

# Refresh View: ========================
function rView {
wmctrl -c 'Alias-View'
aView
}
$fcall rView

# Menu Settings: ==========================
function mSettings {
lt=$(grep "term" $ti | awk 'BEGIN {FS=":" } { print $2 }')
st='@sh -c "echo %2 > $tf & $app setTerm"'
yad --form --css="$tp" --posx=40 --posy=135 --width=300 --fixed --title="vAlias-Settings" --name="mSettings" --window-icon="text-x-script" --f1-action="$app mHelp" --no-buttons --columns=1 \
--field="Set Terminal Command:":lbl "" \
--field="" "$lt" \
--field="Save Command":fbtn "$st" \
--field="Cancel Entry":fbtn "wmctrl -c 'vAlias-Settings'" 2> /dev/null
}
$fcall mSettings

# Set Terminal: ========================
function setTerm {
wmctrl -c 'vAlias-Settings'
read gst < "$tf"
sed -i '/term:/d' "$ti"
echo "term:$gst" >> "$ti"
yad --text="Terminal command has been saved for use." --css="$tp" --title="Saved" --center --text-align=left --fixed --on-top --window-icon="text-x-script" --button="OK":0
}
$fcall setTerm

# Load Terminal: ==========================
function lTerminal {
sterm=$(grep "term" $ti | awk 'BEGIN {FS=":" } { print $2 }')
$sterm
}
$fcall lTerminal

# Menu Theme: ==========================
function mTheme {
gut='@sh -c "echo %2 > $tf & $app tUser"'
gst='@sh -c "echo %5 > $tf & $app tSystem"'
ydo=$(yad --form --css="$tp" --posx=40 --posy=135 --width=300 --fixed --title="vAlias-Theme" --name="mTheme" --window-icon="text-x-script" --f1-action="$app mHelp" --button="Help":3 --button="About":2 --button="Close":1 \
--field="Custom Theme"::LBL "" \
--field="Load Theme:FL" "/usr/share/themes/" \
--field="Apply Custom Theme":fbtn "$gut" \
--field="System Default"::LBL "" \
--field="Mode:CB" "Light Theme\!Dark Theme" \
--field="Apply System Theme":fbtn "$gst" \
--field="Browse Themes Folder":fbtn "$app tBrowse" 2> /dev/null)
ydo=$?
if [[ $ydo -eq 1 ]]; then wmctrl -c 'vAlias-Theme'; fi
if [[ $ydo -eq 2 ]]; then mAbout; fi
if [[ $ydo -eq 3 ]]; then mHelp; fi
}
$fcall mTheme

# User Selected Theme: =================
function tUser {
read gut < "$tf"
sed -i '/stheme:/d' "$ti"
echo "stheme:$gut" >> "$ti"
tApply
}
$fcall tUser

# System Theme: ========================
function tSystem {
read gst < "$tf"
if [ "$gst" = "Dark Theme" ]; then
sed -i '/stheme:/d' "$ti"
echo "stheme:/usr/share/themes/Breeze-Dark/gtk-4.0/gtk.css" >> "$ti"
fi
if [ "$gst" = "Light Theme" ]; then
sed -i '/stheme:/d' "$ti"
echo "stheme:/usr/share/themes/Breeze/gtk-4.0/gtk.css" >> "$ti"
fi
tApply
}
$fcall tSystem

# Apply Theme: =========================
function tApply {
stheme=$(grep "stheme" $ti | awk 'BEGIN {FS=":" } { print $2 }')
export tp="$stheme"
wmctrl -c 'vAlias-Menu'
wmctrl -c 'vAlias-Theme'
mMenu
}
$fcall tApply

# Browse Theme: ========================
function tBrowse {
xdg-open "/usr/share/themes/"
}
$fcall tBrowse

# Main Help: ===========================
function mHelp {
yad --html --browser --css="$tp" --width=900 --height=500 --posx=20 --posy=115 --title="vAlias-Documentation" --name="mHelp" --window-icon="text-html" --uri="https://github.com/rweckert/vAlias/blob/9c53e336c11aaf429f204b0e219e8c79de4262c0/README.md" --file-op
}
$fcall mHelp

# Load Menu: ===========================
function mLoad {
if test -f "$ti"; then
stheme=$(grep "stheme" $ti | awk 'BEGIN {FS=":" } { print $2 }')
export tp="$stheme"
mMenu
else
export tp=""
echo "term:xterm" > "$ti"
mMenu
fi
}
$fcall mLoad

# Exit and Cleanup =====================
function mExit {
wmctrl -c 'vAlias-Menu'
wmctrl -c 'vAlias-View'
wmctrl -c 'vAlias-Theme'
wmctrl -c 'vAlias-Settings'
wmctrl -c 'vAlias-Detail'
wmctrl -c 'vAlias-Documentation'
rm -f "$tf"
rm -f "$tt"
exit
}
$fcall mExit

# About ================================
function mAbout {
yad --about --css="$tp" \
--window-icon="text-x-script" \
--image="text-x-script" \
--authors="Robert W Eckert - rweckert@gmail.com" \
--license="GPL3" \
--comments="A simple alias viewing and backup utility." \
--copyright="Updated 04/20/2025 by Robert W Eckert" \
--pversion="Version: 1.0" \
--pname="vAlias" \
--button="Close!gtk-close":1
}
$fcall mAbout

if [ -z "$1" ]; then mLoad; else $1; fi
