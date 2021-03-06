#!/usr/bin/env bash

### Version 1.0.0
### Created by Erik Berglund
### https://github.com/erikberglund

#//////////////////////////////////////////////////////////////////////////////////////////////////
###
### DESCRIPTION
###
#//////////////////////////////////////////////////////////////////////////////////////////////////

# Outputs a folder hierachy from passed (or current if nothing passed) date.
# Date format defaults to YYYY-MM-DD, if passed date has another format, pass a format string for 'date' to convert passed date.
#
# Example Input: '2016-05-02'
# Expected output: '/2016/05/02'

# Example Input: '1462176024' '%s'
# Expected output: '/2016/05/02'

#//////////////////////////////////////////////////////////////////////////////////////////////////
###
### USAGE
###
#//////////////////////////////////////////////////////////////////////////////////////////////////

# folder_hierachy_from_date "${date_string}" "${date_format_string}"

#//////////////////////////////////////////////////////////////////////////////////////////////////
###
### FUNCTIONS
###
#//////////////////////////////////////////////////////////////////////////////////////////////////

folder_hierachy_from_date() {
    # https://github.com/erikberglund/Scripts/blob/master/functions/Bash/folder_hierachy_from_date/folder_hierachy_from_date.sh
    # Verify input
    if [[ -z ${2} ]] && [[ -n ${1} ]] && [[ ${1} =~ "^[0-9]{4}-[0-9]{2}-[0-9]{2}$" ]]; then
        printf "%s %s\n" "[$( basename ${BASH_SOURCE[0]}):${FUNCNAME}:${LINENO}]" "Passed date doesn't match the format YYYY-MM-DD, please pass a format string to successfully decode passed date." >&2
        printf "%s %s\n" "[$( basename ${BASH_SOURCE[0]}):${FUNCNAME}:${LINENO}]" "Passed date: ${1}" >&2
        exit 1
    fi

    # Assign hierarchy to variable
    local date_output="$( /bin/date -j -f "${2:-%F}" "${1:-$( date +%F )}" "+/%Y/%m/%d" 2>&1 )"
    
    # Verify date command output
    if (( ${?} == 0 )) && [[ ${date_output} =~ ^[/0-9]*$ ]]; then
        printf "%s" "${date_output}"
    else
        printf "%s %s\n" "[$( basename ${BASH_SOURCE[0]}):${FUNCNAME}:${LINENO}]" "$( sed -n '1p' <<< "${date_output}" )" >&2
        printf "%s %s\n" "[$( basename ${BASH_SOURCE[0]}):${FUNCNAME}:${LINENO}]" "$( sed -n '2p' <<< "${date_output}" )" >&2
        exit 1
    fi
}