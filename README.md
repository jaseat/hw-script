# A Simple Bash Script for Making Typical HW Directories
Since our homework projects tend to have uniform folder and file structures I created this script to automate the process. This script is for the bash shell (tested on git-bash for Windows 7). It will create the assets folder and its structure, style.css, app.js, and index.html with starting html with links to the style sheet and javascript.

## How to Use
Take the script from here ('mkhw.sh') and place it in your project directory. Execute the script in bash with the command:

 `./mkhw.sh`
 
This will create the project directory in your current folder. 

You might need to use the following command to make the script executable:

`chmod +x mkhw.sh`

If index.html already exists the script will exit without making any files (this is to prevent overwriting index.html; see next section for details).

The script can take certain command-line arguments.

## Arguments
`--r` Deletes the files and the assets folder created by the script.

`-f` Forces the script to execute. __WARNING:__ For normal operations this will *__overwrite__* the index.html file with the template structure. When paired with the `--r` command this will *__remove everything__* in the assets folder and subfolder, even user created files. __USE WITH CAUTION!__

## Advance Usage
Place the script in a $PATH folder (e.g. `user/bin`) to be able to execute the script anywhere with the command `mkhw.sh`.

## Warning
This script is provided as is. This script has been tested on git-bash in Windows 7. It has not been tested in any other environment.