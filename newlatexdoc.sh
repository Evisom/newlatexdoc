#!/usr/bin/env bash
action=$1
IFS=
scriptFolder=$HOME'/newlatexdoc'

templatesFile=$scriptFolder'/templates.txt'
templateFolder='-1'
function isTemplateExist() {
    name=$1
    templates=$(head $scriptFolder'/templates.txt')
    templates=(${templates//;/ })
    for i in "${templates[@]}"; do
        if [[ $name == $i ]]; then 
            return 1
        fi 
    done
    return 0
}

if [[ $action == "help" ]]; then
    echo 
    echo $(cat $scriptFolder'/help.txt')
    echo 
elif [[ $action == "create" ]]; then 
    if isTemplateExist $2; then 
        $(cp -R $scriptFolder'/'$2'/' $3)
        echo 
        echo "$3 created successfully"
        echo 
    else 
        echo 
        echo "ERROR: There is no template named $2"
        echo
    fi 
elif [[ $action == "add" ]]; then 
    newTemplate=$2
    if [[ -d $newTemplate ]]; then 
        $(cp -R $newTemplate $scriptFolder'/'$newTemplate)
        echo $(cat $scriptFolder'/templates.txt')$newTemplate';' > $scriptFolder'/templates.txt'
        echo
        echo "Template $newTemplate added successfully"
        echo "Run:"
        echo "  ~$ newlatexdoc create $newTemplate foldername"
        echo
    else 
        echo 
        echo "ERROR: There is no folder named $newTemplate"
        echo 
    fi
elif [[ $action == "remove" ]]; then
    if isTemplateExist $2; then 
        newFile=$(echo $(cat $scriptFolder"/templates.txt") | sed 's/'$2';//')
        echo $newFile > $scriptFolder'/templates.txt'
        $(rm -rf $scriptFolder'/'$2)
    else 
        echo "ERROR: There is no template named $2"
    fi 
    
else
    echo 
    echo $(cat $scriptFolder'/nocommand.txt')
    echo 
fi
