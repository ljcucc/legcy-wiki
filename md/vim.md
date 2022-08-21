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

## Enter commands

keybind is not the only way to interact with vim, commands gives you more ways to interact with.

to enter the commands, make sure you're in Normal mode or Visual mode. then type `:` key to start typing commands. then the command prompts will show up at the bottom of your screen. 

### Common commands

here's some commonly seem commands you will using everyday.

```
:q  or :quit         for quit the vim
:w for               for writing file to disk
:e [your-file-path]  for open file from disk
```

you can also combining commands together, for example:

```
:wq        for writing then quit
:q!        force quit when you're quiting without saving file
:e!        force open a new file without saving edited
:qa        quit all edited
```

> notice that if you're edited an opened file, you cannot quit the file without saving it or force to run the command

> to force quit without saving, remember this command!!! `:q!` , you're welcome, you'll never be like most people who don't know how to quit vim.

## Advanced but commonly commands

> the command without `:` begin is keybind
> 

```
:tabnew        new tab
:q             also works on close tab
gt             next tab
gT             backward gt
gt[number]     goto the #number tab
```

## Normal mode operators - Combination of commands

Vim's key bind allows you to doing some combination, which is the most powerful design of vim. for example:

```
[c]hange + [i]n + [w]ord = ciw    which will replace all content in a word.
[v]isual + [i]n + ["]    = vi"    which will selected all content in ".
[d]elete + [i]n + [(]    = di(    which will delete / cut all content in paren.
```

### Repeat combination

to repeat the commands `n` times, you can combine your keybind with a number, for example:

```
[times][keybind]

10j           go down 10 times
10x           delete char 10 times

but...

10jl         is go down 10 lines, and go left 1 char

if you want to go down and left 10 char, you should:

10j10l
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
