path_remove() {
    PATH=$(echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' |sed 's/:$//')
}

path_append() {
    path_remove "$1"
    PATH="${PATH:+"$PATH:"}$1"
}

path_prepend() {
    path_remove "$1"
    PATH="$1${PATH:+":$PATH"}"
}

co () {
[[ -z $1 ]] && echo $0 include_term && exit
file="/Users/sethshapiro/scripting/companies.csv"
grep -ih "$1" "$file"
}

ca () {
# [[ -z $1 ]] && echo $0 include_term && exit
# cd "/Volumes/GoogleDrive/Shared drives/Customer Agreements/MSAs + Client Agreements/$1"
cd "/Volumes/GoogleDrive/Shared drives/Customer Agreements/MSAs + Client Agreements/"
}

here() {
    local loc
    if [ "$#" -eq 1 ]; then
        loc=$(realpath "$1")
    else
        loc=$(realpath ".")
    fi
    ln -sfn "${loc}" "$HOME/.shell.here"
    echo "here -> $(readlink $HOME/.shell.here)"
}

there="$HOME/.shell.here"

# /Volumes/GoogleDrive/Shared drives/Customer Agreements/MSAs + Client Agreements/ID5
