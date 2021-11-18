# Lets check if starship prompt is installed
which starship 2>/dev/null
if [[ $? == 0 ]]; then
  eval "$(starship init bash)"
fi

# Load aliases
for af in ~/.bash.d/aliases/*.als
do
  . $af
done

# Load OS specific settings
. ~/.bash.d/platform/$(uname)

# Load functions
for ff in ~/.bash.d/functions/*.sh
do
  . $ff
done

# Load host custom settings
if [[ -f "$HOME/.bash.d/local.bash" ]]; then
  source "$HOME/.bash.d/local.bash"
fi
