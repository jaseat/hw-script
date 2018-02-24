#!/bin/bash
# Simple Script for making project folder

GIT=false
RESET=false
FORCE=false
REMOVE=false

for args in $@
do
    case $args in
        -git)
            GIT=true
            ;;
        -reset)
            RESET=true 
            ;;
        -f)
            FORCE=true 
            ;;
        --r)
            REMOVE=true
            ;;
        *)
            echo Improper argument: $args
            echo Aborting script
            exit 1
            ;;
    esac
done

if [ "$REMOVE" = true ]
then
    read -p "Warning: This will delete files and folders. Are you sure? (y/n): " DELETE
    if [ "$DELETE" = "y" ]
    then
        if [ -e "./index.html" ] && [ -e "./assets/javascript/app.js" ] && [ -e "./assets/css/style.css" ]
        then
            rm ./index.html ./assets/javascript/app.js ./assets/css/style.css
        fi
        if [ -e "./assets" ]
        then
            if [ "$FORCE" = true ]
            then
                rm -r ./assets
            else
            find ./assets -depth -type d -exec rmdir {} \;
            fi
        fi
        exit
    else
        echo Aborting script 
        exit 1
    fi

fi

echo Creating files...

if [ -e "./index.html" ] && [ $FORCE = false ]
then
    echo "Aborting script: index.html already exists (use -f to overwrite index.html)"
    exit 1
fi

(cat << _EOF_
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>

    <script src="assets/javascript/app.js"></script>
</body>
</html>
_EOF_
) > ./index.html
mkdir -p ./assets/css ./assets/javascript ./assets/images
touch ./assets/javascript/app.js ./assets/css/style.css

if [ "$GIT" = true ]
then
    echo Doing git commands...
    git status > /dev/null
    if [ $? = 0 ]
    then
        echo This is a git folder
    else
        echo This is not a git folder
    fi

fi

echo Done!