#!/usr/bin/env bash
if [ -f ~/.vimrc ]
then 
    echo "Backup .vimrc --> .vimrc_backup"
    mv ~/.vimrc ~/.vimrc_backup
fi

echo "Update .vimrc"
cp ./vimrc ~/.vimrc

if [ -d ~/.vim/after ]
then 
    echo "Backup .vim/after --> .vim/after_backup"
    if [ -d ~/.vim/after_backup ]
    then
        rm -r ~/.vim/after_backup
    fi
    mv ~/.vim/after ~/.vim/after_backup
fi

echo "Update .vim/after"
cp -r ./after ~/.vim/after

if [ ! -d ~/.vim/bundle/vundle ]
then
    echo "Install vundle"
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
else
    vim +BundleClean +qall
fi

echo "Install plugins"
vim +BundleInstall +qall

echo "Install snippets"
if [ -d ~/.vim/bundle/vim-snipmate/snippets ]
then
    cp ./snippets/* ~/.vim/bundle/vim-snipmate/snippets/
else
    cp -r ./snippets ~/.vim/bundle/vim-snipmate/snippets
fi
 
