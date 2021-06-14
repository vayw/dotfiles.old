if [ -d /opt/homebrew/bin ]; then
  PATH=$PATH:/opt/homebrew/bin
fi

# Lets check if starship prompt is installed
if [ -f "$(which starship)" ]; then
  eval "$(starship init bash)"
fi

# Load aliases
for af in ~/.bash.d/aliases/*.als
do
  . $af
done

# Load OS specific settings
. ~/.bash.d/platform/$(uname)
