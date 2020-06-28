shelltoolsdir="$( cd "$( dirname "${BASH_SOURCE:-$0}" )" >/dev/null 2>&1 && pwd )"

echoerr() { echo "$@" 1>&2; }

add_source_lines() {
    shell_name=`basename $SHELL`
    target_file="$HOME/.${shell_name}rc"
    lines_source_file="${shelltoolsdir}/_rc_append.sh"
    lines_to_add=`cat $lines_source_file`

    if [ -f "$target_file" ]
    then
        if ! grep -q "$lines_to_add" "$target_file"; then
            echo "" >> $target_file
            echo "$lines_to_add" >> "${target_file}"
        fi
    else
        echoerr "ENOENT: could not find shell rc file"
        exit 2
    fi
}

add_tools_dir_variable() {
    shell_name=`basename $SHELL`
    target_file="$HOME/.${shell_name}rc"
    lines_to_add="shelltoolsdir=\"${shelltoolsdir}\""

    if [ -f "$target_file" ]
    then
        if ! grep -q "$lines_to_add" "$target_file"; then
            echo "" >> $target_file
            echo "$lines_to_add" >> "${target_file}"
        fi
    else
        echoerr "ENOENT: could not find shell rc file"
        exit 2
    fi
}

add_tools_dir_variable
add_source_lines