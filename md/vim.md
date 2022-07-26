---
title: Vim
public: true
...

vim is a Vi IMproved Editor, which is a keyboard-only text editor allow you to type only with your keyboard by using series of key-binds.

# Basic of vim

Vim have 3 mode while you enter:

* Normal mode
* Visual mode
* Insert mode

Normal mode is the default mode when you enter vim, in this mode you can browsing, moving cursor, typing commands.

Visual mode is the mode you can viewing mode, select text.

Insert mode is the mode you can editing text, insert text.

To moving your cursor by pressing:

* j for down
* k for up
* h for left
* l for right

To enter visual mode, you can using `v` to activate text selection, or `V` (Shift+V) to select whole line.

To enter edit mode, `i` for enter after the cursor, `I` (Shift+I) to edit the first char of a line, `A` (Shift+A) for a last char of the line.

more key bind here:

```
gg          for goto top file
G (shift+G) for goto bottom of the file

Ctrl+h           for goto top of the screen
Ctrl+m           for goto middle of the screen
Ctrl+l           for goto bottom of the screen
```

## Normal mode operators - Combination of commands

Vim's key bind allows you to doing some combination, which is the most powerful design of vim. for example:

```
[c]hange + [i]n + [w]ord = ciw    which will replace all content in a word.
[v]isual + [i]n + ["]    = ci"    which will selected all content in ".
[d]elete + [i]n + [(]    = di(    which will delete / cut all content in paren.
```

# Configuration - vimrc file

> You can get my `.vimrc` file on my [github](https://github.com/ljcucc/terminal_configs/blob/master/vimrc/.vimrc)

Vim's config file is powerful, because the vimrc is a script file, so you can do a lot of thing with in the config file, for example apply different config in different os.

## Keyboard mapping

> learn more about mapping detials on [Vim: Key mapping Guide](https://dev.to/mr_destructive/vim-keymapping-guide-3olb)

usage of `"map"`:

```
{mode}{attr}map {key} {command}
```

### Normal / Visual mode mapping

usage:

```vimrc
map {key} {command}

```

for example

### Normal mode mapping

usage

```vim
nnoremap {key} {command}
```

# Scripting

## Function

```vimrc
function FunctionName()
  " your code here
endfunction
```
