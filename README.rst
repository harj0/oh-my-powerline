===============
Oh My Powerline
===============

About
=====
A zsh-native minimal implementation of `Powerline <https://github.com/Lokaltog/powerline>`_ for use with oh-my-zsh & antigen.

Several existing prompts/themes were very helpful when working on this:

- `agnoster                     <https://gist.github.com/agnoster/3712874>`_
- `oh my zsh powerline theme    <https://github.com/jeremyFreeAgent/oh-my-zsh-powerline-theme>`_
- `powerline                    <https://github.com/Lokaltog/powerline>`_
- `pure                         <https://github.com/sindresorhus/pure>`_
- `seeker                       <https://github.com/tonyseek/oh-my-zsh-seeker-theme>`_
- `steve losh                   <http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/>`_
- `wedisagree                   <https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/wedisagree.zsh-theme>`_

Installation
============
Oh-My-Zsh:

    wget -P ~/.oh-my-zsh/themes/ https://github.com/nfarrar/oh-my-powerline/blob/master/oh-my-powerline.zsh-theme

Antigen:

    antigen theme nfarrar/oh-my-powerline oh-my-powerline


Symbols
=======
The unicode values for the powerline symbols are::

    # Escape Sequence Binding                               Glyph
    # ----------------------------------------------------- -----
    POWERLINE_SYMBOL_VERSION_CONTROL=$(echo -n '\ue0a0')    # 
    POWERLINE_SYMBOL_LINE=$(echo -n '\ue0a1')               # 
    POWERLINE_SYMBOL_PADLOCK=$(echo -n '\ue0a2')            # 
    POWERLINE_SYMBOL_ARROW_RIGHT_BLACK=$(echo -n '\ue0b0')  # 
    POWERLINE_SYMBOL_ARROW_RIGHT=$(echo -n '\ue0b1')        # 
    POWERLINE_SYMBOL_ARROW_LEFT_BLACK=$(echo -n '\ue0b2')   # 
    POWERLINE_SYMBOL_ARROW_LEFT=$(echo -n '\ue0b3')         # 


References
----------
- `OMZ Alias Reference                                              <http://jasonm23.github.io/oh-my-git-aliases.html>`_
- `ZSH Configuration from the Ground Up                             <http://zanshin.net/2013/02/02/zsh-configuration-from-the-ground-up/>`_
- `ZSH Tips by ZZapper                                              <http://www.zzapper.co.uk/zshtips.html>`_
- `ZSH Lovers                                                       <http://grml.org/zsh/zsh-lovers.html>`_
- `Fix for omz git svn prompt slowness                              <https://gist.github.com/msabramo/2355834>`_
- `My ZSH Prompt Long Overdue                                       <https://pthree.org/2008/11/23/727/>`_
- `My Extravagant Zsh Prompt                                        <http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/>`_
- `How to Customize Your Command Prompt                             <http://code.tutsplus.com/tutorials/how-to-customize-your-command-prompt--net-24083>`_
- `Its not enough to bash in heads youve got to bash in minds       <http://www.intridea.com/blog/2011/5/18/its-not-enough-to-bash-in-heads-youve-got-to-bash-in-minds-with-zsh>`_
- `OMZ prompt for git using RVM                                     <https://coderwall.com/p/ocrg7a>`_
- `Unix Zshell Reloaded                                             <http://cwoebker.com/posts/unix-zshell-reloaded>`_
- `Function Time Since Last Git Commit                              <https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/wedisagree.zsh-theme#L66>`_
- `Improving Zsh Startup Time                                       <http://blog.santosvelasco.com/2011/04/22/improving-oh-my-zsh-startup-time/>`_
- `Persistant Directory Stack                                       <http://hints.macworld.com/article.php?story=20050806202859392>`_
- `Auto Jump                                                        <https://github.com/joelthelion/autojump>`_
- `Hack Your Workflow                                               <http://www.harveyxia.com/hack-your-workflow/>`_
- `Vim Text Objects for Zsh                                         <https://github.com/hchbaw/opp.zsh>`_
- `Cool Shell Prompts                                               <http://beatworm.co.uk/blog/computers/cool-shell-prompts/>`_
- `A Beautifully Productive Terminal Experience                     <http://mikebuss.com/2014/02/02/a-beautiful-productive-terminal-experience/>`_


LICENSE
-------
*oh-my-powerline a native zsh-powerline them for use with oh-my-zsh
Copyright (C) <2014> Nathan Farrar

This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.*
