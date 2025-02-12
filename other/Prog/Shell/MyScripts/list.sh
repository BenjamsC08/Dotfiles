#!/bin/bash

if [ $# -eq 0 ]; then
    # Si aucun argument n'est passé, utiliser l'extension par défaut ".c"
    #extension="c"
    find . -type f -exec basename {} \; | sort | tr '\n' ' '
elif [ $# -eq 1 ] && [ "$1" == "-c" ]; then
    # Si deux arguments sont passés et que le premier est "count"
    echo $(ls -1 2>/dev/null | wc -l)
elif [ $# -eq 1 ]; then
    # Si un seul argument est passé, utiliser cet argument comme extension
    extension="$1"
    find . -type f -name "*.$extension" -exec basename {} \; | sort | tr '\n' ' '
elif [ $# -eq 2 ] && [ "$1" == "-c" ]; then
    # Si deux arguments sont passés et que le premier est "count"
    echo $(ls -1 *.$2 2>/dev/null | wc -l)
else
    echo "Usage list :
    list will return all your file but tron \n with ' '
    you can also give an extension like list c
    list c return all file c without \n
    an option is -c to have how many 'ext' file you have
    also can use like this list -c {ext}"
fi

