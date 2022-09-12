# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
ZSH_DISABLE_COMPFIX=true

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
SPACESHIP_CONDA_COLOR=050
setopt EXTENDED_GLOB

autoload -Uz compinit && compinit

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=1
ZSH_CUSTOM_AUTOUPDATE_QUIET=true

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.


plugins=(git zsh-syntax-highlighting aws fzf zsh-completions zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

## For AWS autocomplete
source $HOME/.oh-my-zsh/custom/plugins/fzf-tab-completion/zsh/fzf-zsh-completion.sh
# only aws command completion
zstyle ':completion:*:*:aws' fzf-search-display true
# or for everything
zstyle ':completion:*' fzf-search-display true

SPACESHIP_AWS_SHOW=true
SPACESHIP_AWS_COLOR='yellow'
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias l='colorls --group-directories-first --almost-all'
alias ll='colorls --group-directories-first --almost-all --long' # detailed list view

# Open .zshrc to be edited in VS Code
alias change="code-insiders ~/.zshrc"
# Re-run source command on .zshrc to update current terminal session with new settings
alias update="source ~/.zshrc"

# Uses the zsh precmd function hook to set the tab title to the current working directory before each prompt
function precmd() {
    window_title="\\033]0;${PWD##*/}\\007"
    echo -ne "$window_title"
}

#  Sections:
#  1.  Environment Configuration
#  2.  Make Terminal Better (remapping defaults and adding functionality)
#  3.  File and Folder Management
#  4.  Searching
#  5.  Process Management
#  6.  Networking
#  7.  System Operations & Information
#  8.  Web Development
#  9.  Reminders & Notes
#
#  ---------------------------------------------------------------------------

#   -------------------------------

#   1. ENVIRONMENT CONFIGURATION

#   -------------------------------
#   Change Prompt

#   ------------------------------------------------------------

# export PS1="\w @ \n| $ "

#   Set Paths
#   ------------------------------------------------------------

export PATH="$PATH:/usr/local/bin/"

#   Set Default Editor (change 'Nano' to the editor of your choice)
#   ------------------------------------------------------------

export EDITOR=/usr/bin/nano

#   Set default blocksize for ls, df, du
#   from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
#   ------------------------------------------------------------

export BLOCKSIZE=1k

#   -----------------------------

#   2. MAKE TERMINAL BETTER

#   -----------------------------

alias python='python3'

alias cp='cp -iv'                         # Preferred 'cp' implementation

alias mv='mv -iv'                         # Preferred 'mv' implementation

alias mkdir='mkdir -pv'                   # Preferred 'mkdir' implementation

alias ls='ls -FGlAhogp'                   # Preferred 'ls' implementation

alias less='less -FSRXc'                  # Preferred 'less' implementation

cd() {
    builtin cd "$@"
    ls
} # Always list directory contents upon 'cd'

alias cd..='cd ../'                       # Go back 1 directory level (for fast typers)

alias ..='cd ../'                         # Go back 1 directory level

alias ...='cd ../../'                     # Go back 2 directory levels

alias .3='cd ../../../'                   # Go back 3 directory levels

alias .4='cd ../../../../'                # Go back 4 directory levels

alias .5='cd ../../../../../'             # Go back 5 directory levels

alias .6='cd ../../../../../../'          # Go back 6 directory levels

alias edit='subl'                         # edit:         Opens any file in sublime editor

alias f='open -a Finder ./'               # f:            Opens current directory in MacOS Finder

alias ~="cd ~"                            # ~:            Go Home

alias c='clear'                           # c:            Clear terminal display

# alias which='type -all'                     # which:        Find executables

alias path='echo -e ${PATH//:/\\n}'       # path:         Echo all executable Paths

alias show_options='shopt'                # Show_options: display bash options settings

alias fix_stty='stty sane'                # fix_stty:     Restore terminal settings when screwed up

alias cic='set completion-ignore-case On' # cic:          Make tab-completion case-insensitive

mcd() { mkdir -p "$1" && cd "$1"; }      # mcd:          Makes new Dir and jumps inside

# trash() { command mv "$@" ~/.Trash; }    # trash:        Moves a file to the MacOS trash

ql() { qlmanage -p "$*" >&/dev/null; }   # ql:           Opens any file in MacOS Quicklook Preview

alias DT='tee ~/Desktop/terminalOut.txt' # DT:           Pipe content to file on MacOS Desktop

#   lr:  Full Recursive Directory Listing

#   ------------------------------------------

alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

#   mans:   Search manpage given in agument '1' for term given in argument '2' (case insensitive)

#           displays paginated result with colored search terms and two lines surrounding each hit.            Example: mans mplayer codec

#   --------------------------------------------------------------------

mans() {

    man $1 | grep -iC2 --color=always $2 | less

}

#   showa: to remind yourself of an alias (given some part of it)

#   ------------------------------------------------------------

showa() { /usr/bin/grep --color=always -i -a1 $@ ~/Library/init/bash/aliases.bash | grep -v '^\s*$' | less -FSRXc; }

#   -------------------------------

#   3. FILE AND FOLDER MANAGEMENT

#   -------------------------------

zipf() { zip -r "$1".zip "$1"; }       # zipf:         To create a ZIP archive of a folder

alias numFiles='echo $(ls -1 | wc -l)' # numFiles:     Count of non-hidden files in current dir

alias make1mb='mkfile 1m ./1MB.dat'    # make1mb:      Creates a file of 1mb size (all zeros)

alias make5mb='mkfile 5m ./5MB.dat'    # make5mb:      Creates a file of 5mb size (all zeros)

alias make10mb='mkfile 10m ./10MB.dat' # make10mb:     Creates a file of 10mb size (all zeros)

#   cdf:  'Cd's to frontmost window of MacOS Finder

#   ------------------------------------------------------

cdf() {

    currFolderPath=$(
        /usr/bin/osascript <<EOT

        tell application "Finder"

            try

        set currFolder to (folder of the front window as alias)

            on error

        set currFolder to (path to desktop folder as alias)

            end try

            POSIX path of currFolder

            end tell

EOT

    )

    echo "cd to \"$currFolderPath\""

    cd "$currFolderPath"

}

#   extract:  Extract most know archives with one command

#   ---------------------------------------------------------

extract() {
    if [ -f $1 ]; then
        case $1 in

        *.tar.bz2) tar xjf $1 ;;

        *.tar.gz) tar xzf $1 ;;

        *.bz2) bunzip2 $1 ;;

        *.rar) unrar e $1 ;;

        *.gz) gunzip $1 ;;

        *.tar) tar xf $1 ;;

        *.tbz2) tar xjf $1 ;;

        *.tgz) tar xzf $1 ;;

        *.zip) unzip $1 ;;

        *.Z) uncompress $1 ;;

        *.7z) 7z x $1 ;;

        *) echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

#   ---------------------------

#   4. SEARCHING

#   ---------------------------

alias qfind="find . -name "              # qfind:    Quickly search for file

ff() { /usr/bin/find . -name "$@"; }     # ff:       Find file under the current directory

ffs() { /usr/bin/find . -name "$@"'*'; } # ffs:      Find file whose name starts with a given string

ffe() { /usr/bin/find . -name '*'"$@"; } # ffe:      Find file whose name ends with a given string

#   spotlight: Search for a file using MacOS Spotlight's metadata

#   -----------------------------------------------------------

spotlight() { mdfind "kMDItemDisplayName == '$@'wc"; }

#   ---------------------------

#   5. PROCESS MANAGEMENT

#   ---------------------------

#   findPid: find out the pid of a specified process

#   -----------------------------------------------------

#       Note that the command name can be specified via a regex

#       E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'

#       Without the 'sudo' it will only find processes of the current user

#   -----------------------------------------------------

findPid() { lsof -t -c "$@"; }

#   memHogsTop, memHogsPs:  Find memory hogs

#   -----------------------------------------------------

alias memHogsTop='top -l 1 -o rsize | head -20'

alias memHogsPs='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'

#   cpuHogs:  Find CPU hogs

#   -----------------------------------------------------

alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'

#   topForever:  Continual 'top' listing (every 10 seconds)

#   -----------------------------------------------------

alias topForever='top -l 9999999 -s 10 -o cpu'

#   ttop:  Recommended 'top' invocation to minimize resources

#   ------------------------------------------------------------

#       Taken from this macosxhints article

#       http://www.macosxhints.com/article.php?story=20060816123853639

#   ------------------------------------------------------------

alias ttop="top -R -F -s 10 -o rsize"

#   my_ps: List processes owned by my user:

#   ------------------------------------------------------------
my_ps() { ps $@ -u $USER -o pid,%cpu,%mem,start,time,bsdtime,command; }

#   ---------------------------

#   6. NETWORKING

#   ---------------------------

alias myip='curl ip.appspot.com'                  # myip:         Public facing IP Address

alias netCons='lsof -i'                           # netCons:      Show all open TCP/IP sockets

alias flushDNS='dscacheutil -flushcache'          # flushDNS:     Flush out the DNS Cache

alias lsock='sudo /usr/sbin/lsof -i -P'           # lsock:        Display open sockets

alias lsockU='sudo /usr/sbin/lsof -nP | grep UDP' # lsockU:       Display only open UDP sockets

alias lsockT='sudo /usr/sbin/lsof -nP | grep TCP' # lsockT:       Display only open TCP sockets

alias ipInfo0='ipconfig getpacket en0'       # ipInfo0:      Get info on connections for en0

alias ipInfo1='ipconfig getpacket en1'       # ipInfo1:      Get info on connections for en1

alias openPorts='sudo lsof -i | grep LISTEN' # openPorts:    All listening connections

alias showBlocked='sudo ipfw list' # showBlocked:  All ipfw rules inc/ blocked IPs

#   ii:  display useful host related informaton

#   -------------------------------------------------------------------

ii() {

    echo -e "\nYou are logged on ${RED}$HOST"

    echo -e "\nAdditionnal information:$NC "
    uname -a

    echo -e "\n${RED}Users logged on:$NC "
    w -h

    echo -e "\n${RED}Current date :$NC "
    date

    echo -e "\n${RED}Machine stats :$NC "
    uptime

    echo -e "\n${RED}Current network location :$NC "
    scselect

    echo -e "\n${RED}Public facing IP Address :$NC "
    myip

    #echo -e "\n${RED}DNS Configuration:$NC " ; scutil --dns

    echo

}

#   ---------------------------------------

#   7. SYSTEMS OPERATIONS & INFORMATION

#   ---------------------------------------

alias mountReadWrite='/sbin/mount -uw /' # mountReadWrite:   For use when booted into single-user

#   cleanupDS:  Recursively delete .DS_Store files

#   -------------------------------------------------------------------

alias cleanupDS="find . -type f -name '*.DS_Store' -ls -delete"

#   finderShowHidden:   Show hidden files in Finder

#   finderHideHidden:   Hide hidden files in Finder

#   -------------------------------------------------------------------

alias finderShowHidden='defaults write com.apple.finder ShowAllFiles TRUE'

alias finderHideHidden='defaults write com.apple.finder ShowAllFiles FALSE'

#   cleanupLS:  Clean up LaunchServices to remove duplicates in the "Open With" menu

#   -----------------------------------------------------------------------------------

alias cleanupLS="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

#    screensaverDesktop: Run a screensaver on the Desktop

#   -----------------------------------------------------------------------------------

alias screensaverDesktop='/System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine -background'

#   ---------------------------------------

#   8. WEB DEVELOPMENT

#   ---------------------------------------

alias apacheEdit='sudo edit /etc/httpd/httpd.conf'    # apacheEdit:       Edit httpd.conf

alias apacheRestart='sudo apachectl graceful'         # apacheRestart:    Restart Apache

alias editHosts='sudo edit /etc/hosts'                # editHosts:        Edit /etc/hosts file

alias herr='tail /var/log/httpd/error_log'            # herr:             Tails HTTP error logs

alias apacheLogs="less +F /var/log/apache2/error_log" # Apachelogs:   Shows apache error logs

httpHeaders() { /usr/bin/curl -I -L $@; } # httpHeaders:      Grabs headers from web page

#   httpDebug:  Download a web page and show info on what took time

#   -------------------------------------------------------------------

httpDebug() { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n"; }

#   ---------------------------------------

#   9. REMINDERS & NOTES

#   ---------------------------------------

#   remove_disk: spin down unneeded disk

#   ---------------------------------------

#   diskutil eject /dev/disk1s3

#   to change the password on an encrypted disk image:

#   ---------------------------------------

#   hdiutil chpass /path/to/the/diskimage

#   to mount a read-only disk image as read-write:

#   ---------------------------------------

#   hdiutil attach example.dmg -shadow /tmp/example.shadow -noverify

#   mounting a removable drive (of type msdos or hfs)

#   ---------------------------------------

#   mkdir /Volumes/Foo

#   ls /dev/disk*   to find out the device to use in the mount command)

#   mount -t msdos /dev/disk1s1 /Volumes/Foo

#   mount -t hfs /dev/disk1s1 /Volumes/Foo

#   to create a file of a given size: /usr/sbin/mkfile or /usr/bin/hdiutil

#   ---------------------------------------

#   e.g.: mkfile 10m 10MB.dat

#   e.g.: hdiutil create -size 10m 10MB.dmgf

#   the above create files that are almost all zeros - if random bytes are desired

#   then use: ~/Dev/Perl/randBytes 1048576 > 10MB.dat

export PATH=~/.local/bin:$PATH

export HISTSIZE=9000
export HISTCONTROL=erasedups

source ~/scripts/conda_auto_env
source ~/scripts/auto_venv
source ~/scripts/zsh-poetry/poetry.zsh
export ZSH_POETRY_AUTO_ACTIVATE=1

alias bfg='java -jar ~/bfg-1.13.0.jar'

alias code='code-insiders'
alias rmtrash='trash-put'

## AWS
export PATH=/home/ubuntu/.local/bin:$PATH

## Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-8.jdk/Contents/home/jre

export AUTOSWITCH_DEFAULT_PYTHON="/usr/bin/python3"

## Kubernetes Config PAth
export KUBE_CONFIG_PATH="$HOME/.kube/config"
