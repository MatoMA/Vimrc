#!/usr/bin/bash
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
    mv ~/.vim/after ~/.vim/after_backup
fi

echo "Update .vim/after"
cp -r ./after ~/.vim/after

if [ ! -d ~/.vim/bundle/vundle ]
then
    echo "Install vundle"
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    echo "Install plugins"
    vim +BundleInstall +qall
fi
