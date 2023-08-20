function buildnvim -d "Build neovim from source and install it"
    echo "Saving current version"
    set OLD_VERSION (nvim --version | grep NVIM)
    echo "Entering in neovim source folder..."
    cd $HOME/.src/neovim
    echo "Pulling branch..."
    git pull
    echo "Making a distclean..."
    make distclean
    echo "Running make..."
    make CMAKE_BUILD_TYPE=Release CMAKE_OSX_ARCHITECTURES=arm64 CMAKE_INSTALL_PREFIX=$HOME/.src/builds
    echo "Running make install ..."
    make install
    set NEW_VERSION ($HOME/.src/builds/bin/nvim --version | grep NVIM)
    echo "Previous version was:"
    echo $OLD_VERSION
    echo "New version is:"
    echo $NEW_VERSION
    $HOME/.src/builds/bin/nvim --version | grep ^Build
    echo "Returning to previous directory..."
    cd -
end
