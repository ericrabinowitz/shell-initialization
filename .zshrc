# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH


export ZSH_DISABLE_COMPFIX="true" 


#
# Zephyr O/S Definitions
#
export ZEPHYR_TOOLCHAIN_VARIANT="gnuarmemb"
#export ZEPHYR_BASE="/Users/erabinowitz/proxy/CT-2051/fw-nrf/repos/zephyr"
export GNUARMEMB_TOOLCHAIN_PATH="/usr/local/"
#
# Zephyr O/S Definitions (END)
#

# Path to your oh-my-zsh installation.
export ZSH="/Users/erabinowitz/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
#ZSH_THEME="afowler"
ZSH_THEME="bira"

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
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

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


source ~/proxy_dir.sh


alias h='history 0'
export LS_COLORS='ex=35:di=36:ln=31:*.c=32:*.cpp=32:*.cc=32:*.cxx=32:*.h=33:*.hh=33:*.m=32'
export LSCOLORS='ex=35:di=36:ln=31:*.c=32:*.cpp=32:*.cc=32:*.cxx=32:*.h=33:*.hh=33:*.m=32'
export TERM=xterm-256color

#alias ls='ls -lGH' 
#alias ls='exa -lhr'
alias ls='exa'

#alias l='ls --long --sort newest'
alias l='exa -l -F -a --reverse --sort=modified'


alias j='JLinkExe -device nRF52840_xxAA -if swd -speed 4000'
alias d='newt debug proxy-nano-soc-v2-debug'




WORK_DIRECTORY=~/proxy/fw-nrf/
alias a=alias
f() { pushd $WORK_DIRECTORY
      grep -R $1 . 
      popd
    }
export GREP_OPTIONS='--color=always'
export GREP_COLOR='1;35;40'

HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=$HISTSIZ

setopt auto_list # automatically list choices on ambiguous completion
setopt auto_menu # automatically use menu completion
setopt always_to_end # move cursor to end if word had one match

setopt inc_append_history # save history entries as soon as they are entered


CSCOPE_DB=~/proxy/fw-nrf/cscope.out
export CSCOPE_DB

#vim -t $1

alias cscope_gen="pushd .;cd ~/proxy/fw-nrf;cscope -R;echo \"cscope db completed!\";popd"

update_cscope_db() {
	pushd .
	cd ~/proxy/fw-nrf
	cscope -R
	echo "cscope db completed!"
	popd
}


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


##
#
# XXX ELR XXX
# Overide the bira prompt - remove the host/username from the prompt
#
# Modified and pasted the code from ~/.oh-my-zsh/themes
#
PROMPT="╭─${current_dir}${rvm_ruby}${git_branch}${venv_prompt}
╰─%B${user_symbol}%b "
RPROMPT="%B${return_code}%b"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_RUBY_PROMPT_PREFIX="%{$fg[red]%}‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="› %{$reset_color%}"

ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX="%{$fg[green]%}‹"
ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX="› %{$reset_color%}"
ZSH_THEME_VIRTUALENV_PREFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX
ZSH_THEME_VIRTUALENV_SUFFIX=$ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX
#
# XXX ELR XXX - End of Bira prompt modification
#


#
# XXX ELR XXX - Add iTerm2 Shell Integration
#
source ~/.iterm2_shell_integration.zsh
#
# XXX ELR XXX - end of iTerm2 Shell Integration
#


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
