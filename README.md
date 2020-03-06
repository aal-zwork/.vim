### Install
#### Linux:

    cd ~ 
    git clone https://github.com/aal-zwork/.vim 
    git -C .vim submodule update --init --recursive 
    vim <<-EOF
        :VundleInstall
        :quit
    EOF
    cd -
