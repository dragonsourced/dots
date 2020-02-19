# dots

A repository to easily bootstrap any fresh install with my customizations.  Be
*very* careful around this. I make no promises that it won't brick your PC, and
take absolutely no responsibility if you decide to run it on your system.

    ~/
        bin/
        src/
            scripts/
            utils/
            repos/
            misc/
        pkg/
        pics/
            wall/
                dark
                light

# Dependencies

    Neovim
    Pynvim (install with `pip`)
    Curl
    GNU Make
    Golang

# Installation

    ./install

Also, next time you open Neovim type

    :PlugInstall

to download all the vim-plug stuff that I haven't figured out how to automate yet.
