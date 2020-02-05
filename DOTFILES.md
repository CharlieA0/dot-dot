# Basically how to restore dotfiles

    mkdir .dotfiles
    git init --separate-git-dir=.dotfiles
    git remote add origin git@github.com:CharlieA0/dot-dot.git
    git checkout master
