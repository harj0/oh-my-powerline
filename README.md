# oh-my-powerline

Zsh-native powerline port for use with oh-my-zsh and antigen. Inspiration for this theme has been taken from [oh-my-zsh-powerline-theme](https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme), [agnoster](https://gist.github.com/agnoster/3712874), and [wedisagree](https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/wedisagree.zsh-theme).

The design is intended to be well documented, easy to understand, easy to improve, readily configurable (without rewrite the core of the theme), and intended to be used with [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).

Note: I highly recommend using [antigen](https://github.com/zsh-users/antigen) to mangage your zsh "bundles".

## Status
Currently unstable, actively been worked on.

TODO:

1. Finished modularizing configuration.
2. Add feature to use with a non-patched font.
3. Add feature to write segments with "thin" arrows.
4. Add support for additional version control systems.
5. Optimize load times.

## Preview

Note: Add preview.

## Powerline
[Powerline](https://github.com/Lokaltog/powerline) is an awesome tool written in python that produces very attractive prompts and statusbars for bash, zsh, ipython, tmux, vim and other tools through the use of "patched" unicode fonts which bind symbols to values in the unicode private use area (E0A0-E0A2, E0B0-E0B3). The primary need for these symbols is to define arrows the size of the line height for producing the effect seen [here](https://powerline.readthedocs.org/en/latest/introduction.html#screenshots). Other vanity symbols with special purposes are also defined. This technique has been adopted by several other tools (vim-airline, for example).  This is the technique used in this theme.

*Note: While powerline is an amazing tool, I didn't have the time to put in the effort to learn the internals enough to debug issue - and I have had several performance problems with it that I was unable to resolve.  I decided to create a similar tool for zsh only that would be very fast, easy to extend, easy to configure and easy to debug - hence [oh-my-powerline](https://github.com/nfarrar/oh-my-powerline).*

The unicode values for the powerline symbols are:

    # Escape Sequence Binding                               Glyph
    # ----------------------------------------------------- -----
    POWERLINE_SYMBOL_VERSION_CONTROL=$(echo -n '\ue0a0')    # 
    POWERLINE_SYMBOL_LINE=$(echo -n '\ue0a1')               # 
    POWERLINE_SYMBOL_PADLOCK=$(echo -n '\ue0a2')            # 
    POWERLINE_SYMBOL_ARROW_RIGHT_BLACK=$(echo -n '\ue0b0')  # 
    POWERLINE_SYMBOL_ARROW_RIGHT=$(echo -n '\ue0b1')        # 
    POWERLINE_SYMBOL_ARROW_LEFT_BLACK=$(echo -n '\ue0b2')   # 
    POWERLINE_SYMBOL_ARROW_LEFT=$(echo -n '\ue0b3')         # 

Note: This table can be copied and pasted into your shell for testing the symbols.

## Installation
Installation of the theme itself is straight forward. Installing a patched font is a little more tricky, however comprehensive instructions are provided below.

    # oh-my-zsh without antigen
    wget -P $HOME/.oh-my-zsh/themes https://github.com/nfarrar/oh-my-powerline/blob/master/oh-my-powerline.zsh-theme
    echo "ZSH_THEME=\"robbyrussell\"" >> ~/.zshrc
    exec zsh --login

    # oh-my-zsh with antigen
    echo "antigen theme nfarrar/oh-my-powerline powerline" >> ~/.zshrc
    exec zsh --login

### Powerline Font Patching
Several methods can be used to setup a patched font. I prefer the following method (requires homebrew, tested on OSX 10.9.3):

    # url for powerline-fontpatcher git repository
    plfp_git_url=https://github.com/Lokaltog/powerline-fontpatcher.git

    # where we will install the powerline-fontpatcher src
    plfp_src_dir=~/.local/src/powerline-fontpatcher

    # install fontforge - required by powerline-fontpatcher
    brew install fontforge --with-python

    # clone powerline-fontpatcher
    git clone $plfp_git_url $plfp_src_dir
    cd $plfpsrc && python setup.py install && cd

    # export the path to the powerline symbols sfd file
    export POWERLINE_SYMBOLS_SFD=~/.local/src/powerline-fontpatcher/fonts/powerline-symbols.sfd

Note: Each time you use powerline-fontpatcher, you'll need the patch to the SFD file. If you intend to install multiple fonts you may want to export this path in your zsh configuration.

With fontpatcher installed, we need to patch and install a font. This example uses the adobe source code pro font.

    # pass a url to a zip archive containing .TTF font files to this function to
    # automatically patch and install the font
    function omzpl_patch_font () {
        local urlsrc=$1
        local omzpl_tmp=/tmp/omzpl
        local prepatched=$omzpl_tmp/prepatched
        local patched=$omzpl_tmp/patched

        mkdir -p $prepatched
        unzip =( curl -L $urlsrc ) -d $prepatched

        mkdir -p $patched && cd $patched
        find $prepatched -name \*.ttf -exec powerline-fontpatcher --source-font=$POWERLINE_SYMBOLS_SFD --no-rename {} \;
        mv *.ttf /Library/Fonts && cd && rm -rf $omzpl_tmp
    }

    # patch & install the source code pro font
    omzpl_patch_font http://sourceforge.net/projects/sourcecodepro.adobe/files/SourceCodePro_FontsOnly-1.017.zip

### Terminal Configuration
Once you have installed a patched font, you'll need to configure your terminal to use the patched font.
The following instructions explain how I configure [iTerm2](http://www.iterm2.com/) on OSX.

    FONT:         iTerm2 ➟ Preferences ➟ Profiles ➟ Text ➟ Ascii (Source Code Pro)
                  iTerm2 ➟ Preferences ➟ Profiles ➟ Text ➟ Non-Ascii Font (Source Code Pro)
    CONTAST:      iTerm2 ➟ Profiles ➟ Colors ➟ Minimum contrast ➟ 0
    TRANSPARENCY: iTerm2 ➟ Profiles ➟ Window ➟ Transparency ➟ Opaque

Notes:
+ If you installed the patched font with the instructions above, your patched font will retain it's original name. If you installed a prepatched font or utilized another method, your font may be named "<Font Name> for Powerline".
+ You may need to adjust the vertical line height for the fonts (in iTerm2) to ensure the segment characters line up correctly.
+ The color contrast setting in iTerm2 has an impact on the way the powerline prompt is rendered. Unfortunately, there is not yet a setting to disable this. To make my prompt render correctly, I had to disable the color contrast completely - otherwise the segment characters will be rendered in a slightly offset color.
+ When iTerm2 renders transparency, it applies the transparency to the terminal text as well. As far as I can tell there is not a way to disable this. Because of the way the prompt is drawn, this creates a very ugly prompt (similar to how the contrast functions). This unfortunately (at current) means transparency must be disabled as well.

### Testing the Patched Font
Once the patched font is installed and the terminal has been configured, make sure they are displayed correctly:

    echo -e "Version Control:       \ue0a0"
    echo -e "Line:                  \ue0a1"
    echo -e "Padlock:               \ue0a2"
    echo -e "Arrow Right, Black:    \ue0b0"
    echo -e "Arrow Right:           \ue0b1"
    echo -e "Arrow Left, Black:     \ue0b2"
    echo -e "Arrow Left:            \ue0b3"

### Font Patching References
Additional information on powerline font patching can be found at the following references:

+ [Powerline - Font Patching Instructions](https://powerline.readthedocs.org/en/latest/fontpatching.html)
+ [Powerline Fontpatcher](https://github.com/Lokaltog/powerline-fontpatcher)
+ [Powerline Prepatched Fonts](https://github.com/Lokaltog/powerline-fonts)
+ [FontForge](http://fontforge.org/)
+ [Adobe Source Code Pro Open Source Font](https://github.com/adobe/source-code-pro)

Requirements:

* Vim Powerline patched font: Download your favorite one on [Lokaltog/powerline-font](https://github.com/Lokaltog/powerline-fonts).
* Z shell (zsh): See [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) for more info.
* Make sure terminal is using 256-colors mode with `export TERM="xterm-256color"`.

## Configuration
Note: Documentation added soon.

## References
I referenced a lot of information while figuring out a working method for font-patching and writing this theme - I have included them below.

### Zsh Tools & Frameworks

+ [antigen](https://github.com/zsh-users/antigen)
+ [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh)
+ [stderred](https://github.com/sickill/stderred)

### Zsh Theme Configuration

+ [Fix for oh-my-zsh git-svn prompt slowness](https://gist.github.com/msabramo/2355834)
+ [My ZSH Prompt Long Overdue](https://pthree.org/2008/11/23/727/)
+ [Steve Losh - My Extravagant Zsh Prompt](http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/)
+ [TutsPlus - How to Customize Your Command Prompt](http://code.tutsplus.com/tutorials/how-to-customize-your-command-prompt--net-24083)
+ [It's not enough to bash in heads, you've got to bash in minds...with ZSH](http://www.intridea.com/blog/2011/5/18/its-not-enough-to-bash-in-heads-youve-got-to-bash-in-minds-with-zsh)
+ [Oh-my-zsh prompt for git (using RVM)](https://coderwall.com/p/ocrg7a)
+ [Unix Zshell Reloaded](http://cwoebker.com/posts/unix-zshell-reloaded)
+ [Function - Time Since Last Git Commit](https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/wedisagree.zsh-theme#L66)
+ [Improving Zsh Startup Time](http://blog.santosvelasco.com/2011/04/22/improving-oh-my-zsh-startup-time/)

### Zsh Reference

+ [oh-my-zsh alias reference](http://jasonm23.github.io/oh-my-git-aliases.html)
+ [Zsh Configuration from the Ground Up](http://zanshin.net/2013/02/02/zsh-configuration-from-the-ground-up/)
+ [ZSH Tips by ZZapper](http://www.zzapper.co.uk/zshtips.html)
+ [zsh-lovers](http://grml.org/zsh/zsh-lovers.html)

### Themes

*Note: Much inspiration was taken from the following themes:*

+ [agnoster theme for oh-my-zsh](https://gist.github.com/agnoster/3712874)
+ [oh-my-zsh-powerline-theme](https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme)
+ [wedisagree theme for oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/wedisagree.zsh-theme)


### Contribute

* Create an issue if you find a bug or if you want to request a new feature.
* To contribute directly - fork the project, add a feature, and submit a pull request.

### LICENSE

*oh-my-powerline a native zsh-powerline them for use with oh-my-zsh  
Copyright (C) <2014> Nathan Farrar  

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.*
