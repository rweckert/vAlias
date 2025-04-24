# <img align="left" width="48" src="Icon-vAlias.png" /> vAlias
A simple alias viewing and backup utility.

### Script Purpose as a Tool:
Provides simplicity in viewing alias file entries. Allows for sorting the alias file by name or command. When viewing alias entries, option for Backup, Save As, and Edit Copy are available. Open the terminal window from the main menu to test any system changes that you have made directly. **NOTE:** The script vAlias does not directly edit any system files. The vAlias script makes a copy of the ".bash_aliases" file to a temporary folder for viewing, opening, editing and saving. 

![vAlias Screenshot](https://github.com/rweckert/vAlias/blob/8c750932668039121f822a129f4fa9b81846884a/screenshot-vAlias.jpg)

### Setup:
1. Please review "[Common System Requirements](https://github.com/rweckert/vAlias/blob/main/README.md#common-system-requirements)" and "[Critical System Requirements](https://github.com/rweckert/vAlias/blob/main/README.md#critical-system-requirements)" sections below for basic and critical requirements to run this script successfully.
2. Save the vAlias.sh file to a directory.
3. Make the vAlias.sh script executable by running the following command in the same directory as the vAlias.sh file: <br/>
_chmod +x vAlias.sh_

### Features:
- Easily view and sort alias commands.
- Backup current alias command list.
- Edit a copy of the alias command list.
- Save the alias command list as a separate file.
- Refresh the alias view as you make direct changes.
- Copy a selected alias command to the system clipboard.
- Open the terminal to test alias changes from the menu.
- Specify the command used to open a terminal session.
- Use the 'F1' key for documentation from any main window.

### Typical Usage:
Upon opening the vAlias script, click on the option for "View Alias". This will show you a list of all alias commands from a copied ".bash_aliases" file. Easily sort, save, and edit as needed. A double click on a alias command entry will show you the details of that command where you can copy the command to the system clipboard. Open the terminal using the "Terminal" option where you can test your direct changes.

### Detailed Options and Usage:
**Main Menu:** When running the vAlias script the main menu will appear with the following options:<br/>
**- View Alias:** Opens the "Alias View" window showing all alias commands.<br/>
**- Refresh:** Updates the Alias Detail view window and displays any changes.<br/>
**- Terminal:** Opens the terminal window. Change the command that opens the terminal window using the "Settings" option.<br/>
**- Settings:** Customize the command that opens the terminal window.<br/>
**- Theme:** Options will allow you to select a theme for vAlias.<br/>
**- Help:** Opens vAlias documentation.<br/>
**- Exit:** Closes all vAlias windows and menus.<br/>

### View Alias Window:
This window displays all the alias commands from the ".bash_aliases" file. Options and features are as follows:<br/>
**- Double Click:** Perform a double click on a listed alias command to open the vAlias Detail window.<br/>
**- Backup:** Allows the user to select a directory to backup a copy of all alias commands.<br/>
**- Save As:** Save a copy of the ".bash_aliases" file into a directory specified.<br/>
**- Edit Copy:** Opens a copy of the ".bash_aliases" file in the default text editor.<br/>
**- Help:** Opens help documentation.<br/>
**- Close:** Closes the "vAlias-View" window.<br/>

### vAlias Detail Window:
Double clicking on a listed alias command from the "vAlias-View" window will open the "vAlias Detail" window with the following options:<br/>
**- Copy Alias:** Copies the listed alias command to the system clipboard.<br/>
**- Close Detail:** Closes the "vAlias Detail" window.<br/>

### vAlias Settings:
This window allows you to customize the command used to open the terminal window:<br/>
**- Set Terminal Command:** Enter the command used to open the terminal window of your choice when using the "Terminal" option from the main menu.<br/>
**- Save Command:** Saves the command entered for future use.<br/>
**- Cancel Entry:** Closes the "vAlias Settings" window without saving changes.

### Theme Options:
The "Theme" main menu option allows the user to change settings for the theme being used, as well as access to "Help" and "About" options.<br/>
**- Load Theme:** Allows the user to browse their system for a theme to use.<br/>
**- Apply Loaded Theme:** Applies the loaded theme. Once selected the Options window will close and re-open showing the theme selected in use.<br/>
**- Mode:** Select basic system theme available in the system for "Light Theme" or "Dark Theme". This default uses the "Breeze" theme package located in the "/usr/share/themes/" folder.<br/>
**- Apply System Theme:** Applies the Mode selected for either "Light Theme" or "Dark Theme". Once selected the Options window will close and re-open showing the theme selected in use.<br/>
**- Browse Themes Folder:** Browse the default themes folder "/usr/share/themes/".<br/>
**- Help:** Opens gMapping help documentation.<br/>
**- About:** Opens the about window showing script credits.<br/>
**- Close:** Closes the "Options" window.<br/>

### Notes:
- vAlias can be ran from any directory.<br/>
- vAlias uses the /tmp/ folder for temporary and .ini files.<br/>
- If the ".bash_aliases" file does not exist the utility will not display any alias commands. <br/>
- Use the 'F1' key for documentation from any main window.

### vAlias Shortcut File:<br/>
Save the following as a file named "vAlias.desktop" in creating a shortcut to this utility. Update the path for "Exec" to where the script is stored:<br/>
[Desktop Entry]<br/>
Name=vAlias<br/>
GenericName=vAlias<br/>
Comment=A simple alias viewing and backup utility.<br/>
Exec=/PathToScript/vAlias.sh<br/>
Type=Application<br/>
Icon=gtk-zoom-fit<br/>
Terminal=false<br/>

### Common System Requirements:
Common shell commands found in most Linux installations are used to provide system functionalilty for this and other scripts shared from this profile. For thoroughness, these common shell commands are listed in alphabetical order with version and man page link for review: [https://github.com/rweckert/vAlias/blob/07e596423567771d7b7c8428ae76c4e5d744ba91/README-Basic-Requirements.md](https://github.com/rweckert/vAlias/blob/07e596423567771d7b7c8428ae76c4e5d744ba91/README-Basic-Requirements.md)

### Critical System Requirements:
Packages listed below provide the core ingredients for graphic display and desired output that enables mRunner to deliver output and are critical for successful execution of the the script:
| Package       | Version              | Notes         |
|     :---:     |         :---:        | :---          |
| yad           | 14.0+ (GTK+ 3.24.41) | A tool for developing graphical user interfaces in Linux and is used by this script to generate menus and dialog windows, is written by Victor Ananjevsky. **Download:** [https://github.com/v1cont/yad](https://github.com/v1cont/yad) **Setup:** Step by step instructions are available for either Linux or Microsoft Windows Subsystem for Linux (WSL) using a Debian base: [https://github.com/rweckert/yad-14.0-Setup-From-Scratch](https://github.com/rweckert/yad-14.0-Setup-From-Scratch) |

### Closing:
Script interface written by: Robert W. Eckert - rweckert@gmail.com Please feel free to email to submit bugs, changes or requests. This script comes with absolutely no warranty. See the link for the GNU General Public License, version 3 or later listed below for further details.

---

### Project Contents:
**Project Page:** <br/>
[https://github.com/rweckert/vAlias](https://github.com/rweckert/vAlias) <br/>
**Source File:** <br/>
[https://github.com/rweckert/vAlias/blob/5a9b0187198c4743d73f15f4b4fd70f8b794bb28/vAlias.sh](https://github.com/rweckert/vAlias/blob/5a9b0187198c4743d73f15f4b4fd70f8b794bb28/vAlias.sh) <br/>
**Documentation File:** <br/>
[https://github.com/rweckert/vAlias/blob/5a9b0187198c4743d73f15f4b4fd70f8b794bb28/README.md](https://github.com/rweckert/vAlias/blob/5a9b0187198c4743d73f15f4b4fd70f8b794bb28/README.md) <br/>
**Project Screenshot:** <br/>
[https://github.com/rweckert/vAlias/blob/5a9b0187198c4743d73f15f4b4fd70f8b794bb28/screenshot-vAlias.jpg](https://github.com/rweckert/vAlias/blob/5a9b0187198c4743d73f15f4b4fd70f8b794bb28/screenshot-vAlias.jpg) <br/>
**Project Licensing:** <br/>
[https://github.com/rweckert/vAlias/blob/eed51547e49903df6f96930daf54f03dbcb62838/LICENSE](https://github.com/rweckert/vAlias/blob/eed51547e49903df6f96930daf54f03dbcb62838/LICENSE) <br/>
**GitHub Profile Page:** <br/>

[https://github.com/rweckert](https://github.com/rweckert)
