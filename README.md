### Install
#### Linux:

    git -C ~ clone https://github.com/aal-zwork/.vim 
    git -C ~/.vim submodule update --init --recursive 
    vim &>/dev/null <<-EOF
        :VundleInstall
        :quita
    EOF
