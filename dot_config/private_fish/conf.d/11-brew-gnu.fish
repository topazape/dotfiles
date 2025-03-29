#gnu
switch (uname)
  case Darwin
    alias rm="rm -i"

    # coreutils
    if test -d (brew --prefix coreutils)
      fish_add_path (brew --prefix coreutils)/libexec/gnubin
      # aliases
      alias ls="ls --classify --color=auto"
      alias ll="ls -lh"
      alias la="ls -a"
    else
      echo "coreutils is not installed"
    end
    # findutils
    if test -d (brew --prefix findutils)
      fish_add_path (brew --prefix findutils)/libexec/gnubin
    else
      echo "findutils is not installed"
    end
    # gnu-sed
    if test -d (brew --prefix gnu-sed)
      fish_add_path (brew --prefix gnu-sed)/libexec/gnubin
    else
      echo "gnu-sed is not installed"
    end
    # gawk
    if test -d (brew --prefix gawk)
      fish_add_path (brew --prefix gawk)/libexec/gnubin
    else
      echo "gawk is not installed"
    end
    # gnu-grep
    if test -d (brew --prefix grep)
      fish_add_path (brew --prefix grep)/libexec/gnubin
      # aliases
      alias grep="grep --color=auto"
    else
      echo "gnu-grep is not installed"
    end
  case Linux
    # aliases
    alias ls="ls --classify --color=auto"
    alias ll="ls -lh"
    alias la="ls -a"
    alias grep="grep --color=auto"
    alias rm="rm -i"
end
