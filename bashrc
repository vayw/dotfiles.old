
# will we go?
if [ -d ~/go/bin ]; then
  PATH=$PATH:~/go/bin
fi

# Load aliases
for af in ~/.bash.d/aliases/*.als
do
  . $af
done

# Load OS specific settings
source ${HOME}/.bash.d/platform/$(uname)

# Load functions
for ff in ~/.bash.d/functions/*.sh
do
  . $ff
done

# Load host custom settings
if [[ -f "$HOME/.bash.d/local.bash" ]]; then
  source "$HOME/.bash.d/local.bash"
fi

# setup prompt
. ${HOME}/.bash.d/prompt
