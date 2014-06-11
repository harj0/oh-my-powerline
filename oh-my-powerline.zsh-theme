# LICENSE -------------------------------------------------------------------- ↩

#   oh-my-powerline a native zsh-powerline them for use with oh-my-zsh
#   Copyright (C) <2014> Nathan Farrar

#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.

#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.

#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.


# UNICODE SYMBOLS ------------------------------------------ POWERLINE SYMBOLS ↩


OMPL_SYMBOL_POWERLINE_VERSION_CONTROL_BRANCH=''
OMPL_SYMBOL_POWERLINE_LINE=''
OMPL_SYMBOL_POWERLINE_PADLOCK=''
OMPL_SYMBOL_POWERLINE_ARROW_RIGHT_SOLID=''
OMPL_SYMBOL_POWERLINE_ARROW_RIGHT_THIN=''
OMPL_SYMBOL_POWERLINE_ARROW_LEFT_SOLID=''
OMPL_SYMBOL_POWERLINE_ARROW_LEFT_THIN=''


# UNICODE SYMBOLS ------------------------------------------- STANDARD SYMBOLS ↩


OMPL_SYMBOL_ARROW_LEFT='←'
OMPL_SYMBOL_ARROW_UP='↑'
OMPL_SYMBOL_ARROW_RIGHT='→'
OMPL_SYMBOL_ARROW_DOWN='↓'

OMPL_SYMBOL_COMMAND='⌘'
OMPL_SYMBOL_OPTION='⌥' 
OMPL_SYMBOL_CONTROL='⌃' 
OMPL_SYMBOL_SHIFT='⇧' 
OMPL_SYMBOL_CAPSLOCK='⇪' 
OMPL_SYMBOL_TAB='⇥' 
OMPL_SYMBOL_TAB_BACK='⇤' 
OMPL_SYMBOL_RETURN='↩' 
OMPL_SYMBOL_ENTER='⌤' 
OMPL_SYMBOL_DELETE='⌫' 
OMPL_SYMBOL_DELETE_FORWARD='⌦' 
OMPL_SYMBOL_PAGE_UP='⇞' 
OMPL_SYMBOL_PAGE_DOWN='⇟' 
OMPL_SYMBOL_HOME='↖' 
OMPL_SYMBOL_END='↘' 
OMPL_SYMBOL_CLEAR='⌧' 
OMPL_SYMBOL_SPACE='␣' 
OMPL_SYMBOL_ESCAPE='⎋' 
OMPL_SYMBOL_EJECT='⏏'

OMPL_SYMBOL_APPLE=''
OMPL_SYMBOL_FLAG='⚑'
OMPL_SYMOBL_DOT='✹'
OMPL_SYMBOL_YINGYANG='☯'
OMPL_SYMBOL_BIOHAZARD='☢'
OMPL_SYMBOL_STAR='★'
OMPL_SYMBOL_CHECK='✔'
OMPL_SYMBOL_X='✘'
OMPL_SYMBOL_FILE='⨍'
OMPL_SYMBOL_SPADE='♠'
OMPL_SYMBOL_CLUB='♣'
OMPL_SYMBOL_HEART='❤'
OMPL_SYMBOL_DIAMOND='♦'
OMPL_SYMBOL_SMILE='☺'
OMPL_SYMBOL_FROWN='☹'

OMPL_SYMBOL_REPO_GIT='Ⓖ'
OMPL_SYMBOL_REPO_MERCURIAL='Ⓜ'
OMPL_SYMBOL_REPO_SUBVERSION='Ⓢ'
OMPL_SYMBOL_REPO_CVS='Ⓒ'
OMPL_SYMBOL_REPO_BAZARR='Ⓑ'
OMPL_SYMBOL_REPO_VCS='Ⓥ'


# CONFIGURATION ---------------------------------------------- SYMBOL BINDINGS ↩



# CONFIGURATION ---------------------------------------------- SYMBOL BINDINGS ↩


# PROMPT SEGMENT ------------------------------------------------ SHELL STATUS ↩


# Displays a "smiley" in green or "frowney" in red, depending on the exit
# status of the last executed command.
# This seems to have broken when I added the virtualenv segment. Needs to be
# fixed. Also will probably add a history line indicator for easily repeating
# commands.

OMPL_RETURN_VALUE=%?
OMPL_NUM_JOBS=%j
OMPL_HIST_NUM=%h

function ompl_segment_status() {
    local bg_color='green'



    if [[ $OMPL_RETURN_VALUE == 0 ]]; then
        ompl_build_segment " ☺ " 'green' 'black'
    else
        ompl_build_segment " ☹ " 'red' 'black'
    fi
}


# PROMPT SEGMENT ----------------------------------------- SESSION INFORMATION ↩


# Displays useful information about the current session.
function ompl_segment_session() {

    if [[ -n $SSH_CLIENT ]]; then
        ompl_build_segment " %n@%m " 'yellow' 'black'
    else
        ompl_build_segment " %n@%m:%l " 'yellow' 'black'
    fi
}


# PROMPT SEGMENT ---------------------------------------------------- DIRSTACK ↩


# Displays the directory path.
function ompl_segment_dirstack() {
    ompl_build_segment " %~ " 'blue' 'black'
}


# PROMPT SEGMENT ------------------------------------------------- DATE & TIME ↩


function ompl_segment_datetime() {
    ompl_build_segment " %D{%Y-%m-%d %H:%M:%S} " 'magenta' 'black'
}

function segment_git() {
    ompl_build_segment "$(git_prompt_info)" 'cyan' 'black'
}


# PROMPT SEGMENT --------------------------------------------------------- GIT ↩


ZSH_THEME_GIT_PROMPT_CLEAN=$OMPL_SYMBOL_CHECK
ZSH_THEME_GIT_PROMPT_DIRTY=$OMPL_SYMBOL_X
ZSH_THEME_GIT_PROMPT_PREFIX="$OMPL_SYMBOL_POWERLINE_VERSION_CONTROL_BRANCH "
ZSH_THEME_GIT_PROMPT_SUFFIX=" "

function ompl_segment_git() {
    ompl_build_segment "$(git_prompt_info)" 'cyan' 'black'
}


# PROMPT SEGMENT -------------------------------------------------- VIRTUALENV ↩


# Requires the virtualenv plugin by Tony Seek. To install with antigen add the
# following line to your .zshrc:
# bundle antigen bundle tonyseek/oh-my-zsh-virtualenv-prompt

export ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX=$OMPL_SYMBOL_FILE
export ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX=" "

function ompl_segment_virtualenv() {
    if [[ -n $VIRTUAL_ENV ]]; then
        ompl_build_segment "$(virtualenv_prompt_info)" 'magenta' 'black'
    fi
}


# PROMPT SEGMENT ------------------------------------------------- SEGMENT CAP ↩


# The last segment to be written can be explicitly terminated by appending the
# 'terminate' paremeter to the call to build_segment. If the last is not always
# written, then terminating would not occur. As a simple workaround, I cap
# the prompt with an empty, white segment. I will probably fix this in the
# future.

function ompl_segment_cap() {
    ompl_build_segment " " 'white' 'black' 'terminate'
}


# UTILITY ------------------------------------------------------ BUILD SEGMENT ↩


# The build_segment function is the underlying workhorse for segment writing.
# I looked closely at several mechanisms others have used for building
# powerline segment writing algorithms and attempted to retain the optimzations
# from the best while making it user friendly enough to be modified by others.

OMPL_CONFIG_LEFT_SEPARATOR=$OMPL_SYMBOL_POWERLINE_ARROW_RIGHT_SOLID
OMPL_CONFIG_RIGHT_SEPARATOR=$OMPL_SYMBOL_POWERLINE_ARROW_LEFT_SOLID

# Usage: ompl_build_segement <content> <:bgcolor> <:fgcolor> <:terminate>
function ompl_build_segment() {
    local bg fg terminate
    [[ -n $2 ]] && bg="%K{$2}" || bg="%k"
    [[ -n $3 ]] && fg="%F{$3}" || fg="%f"
    [[ -n $4 ]] && terminate='true' || terminate='false'

    # track the segment count so separators can be drawn correctly
    (( SEGMENT_COUNT = $SEGMENT_COUNT + 1 ))

    # Draw the segment separator. For the left prompt - the seperator is not
    # drawn for the first segment - and subsequent segments (excluding the
    # last) draw the separator for the previous segment. The right prompt
    # draws the separator for the current segment.

    if [[ $OMPL_SEGMENT_ALIGN == 'left' && $SEGMENT_COUNT > 1 ]]; then
        echo -en "%F{$OMPL_SEGMENT_PREBG}$bg$OMPL_CONFIG_LEFT_SEPARATOR"
    elif [[ $OMPL_SEGMENT_ALIGN == 'right' && $SEGMENT_COUNT == 1 ]]; then
        echo -en "%F{$2}%K{default}$OMPL_CONFIG_RIGHT_SEPARATOR"
    fi

    # Draw the segment content.
    echo -en "$bg$fg$1"

    # Terminate the left prompt by drawing a trailing segment symbol.
    if [[ $OMPL_SEGMENT_ALIGN == 'left' && $terminate == 'true' ]]; then
        echo -en "%F{$2}%K{%k}$OMPL_CONFIG_LEFT_SEPARATOR "
    else
        OMPL_SEGMENT_PREBG=$2
    fi
}


# UTILITY ------------------------------------------------------- BUILD PROMPT ↩


# Builds the left prompt.
function ompl_build_prompt() {
    OMPL_SEGEMENT_COUNT=0
    OMPL_SEGMENT_ALIGN='left'
    OMPL_SEGMENT_PREBG='default'

    ompl_segment_status
    ompl_segment_session
    ompl_segment_dirstack
    ompl_segment_virtualenv
    ompl_segment_cap
}


# UTILITY ------------------------------------------------------ BUILD RPROMPT ↩


# Builds the right prompt.
function ompl_build_rprompt() {
    OMPL_SEGEMENT_COUNT=0
    OMPL_SEGMENT_ALIGN='right'
    OMPL_SEGMENT_PREBG='default'

    ompl_segment_git
    ompl_segment_datetime
}


# FINAL ---------------------------------------------------------- SET PROMPTS ↩


PROMPT='%{%f%b%k%}$(ompl_build_prompt)%{%f%b%k%}'
RPROMPT='%{%f%b%k%}$(ompl_build_rprompt)%{%f%b%k%}'

