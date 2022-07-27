---
title: Bash Scripting
public: false
...

用 bash scripting 發揮你的最大效率

> 有關 [我的配置](my-config.html)

### 什麼是 Bash？

bash 是一種 [shell](https://zh.wikipedia.org/zh-tw/%E6%AE%BC%E5%B1%A4) ，簡單來說就是幫助我們跟內核溝通的一個軟體。

> 什麼是 Terminal 呢？看看這篇文章：[Intro to Terminal](./intro-2-terminal.html) 和 [Intro to C dev](./c-lang.html)

### 簡單的 Bash Scripting

檔案管理和瀏覽：

* `pwd` : 列出你當前訪問的位置，好比你在「檔案總管」或「finder」當前開啟的資料夾的概念
* `ls` : 列出當前資料夾中的所有檔案或資料夾
* `ls ./dir/` : 列出dir資料夾中的所有檔案或資料夾
* `cd ./dir/` : 進去其資料夾
* `touch file.txt` : 創建一個空文件
* `mkdir new_folder` : 創建一個新的資料夾
* `rm file_name` : 刪除一個檔案
* `rm -rf folder_name` : 刪除一個資料夾
* `cp file_name` : 複製一個檔案
* `cp -rf folder_name` : 複製一個資料夾
* `cat file_name` : 顯示一個檔案的內容（文字）
* `nano file_name` : 用 nano 文字編輯一個檔案 （新手友善）
* `vim file_name` : 用 vim 文字編輯一個檔案 (老手推薦)

> 結尾冒號不列入指令

系統應用工具：

* `apt-get`: 套件管理器
* `python3`: 沒錯，有時候python也會派上用場
* `sed`: 文字轉換工具
* `awk`: 文字處理工具
* `code`: VSCode (如果你有裝的、並且設定 $PATH 的話)

### 撰寫 bash 腳本

```bash
# 這個是註解
$ touch my_script.sh

# 使用 vim 文字編輯器開啟
$ vim my_script.sh
```

### ZSH Shortcut

Cursor: 

* `Ctrl-A`: Jump to the start of the line
* `Ctrl-E`: Jump to the end of the line
* `Ctrl-F`: Jump forward one character
* `Ctrl-B`: Jump backward one character
* `Alt-F`: Jump forward one word1
* `Alt-B`: Jump backward one word1

Cleaning:

* `Ctrl-L`: Clear screen
* `Ctrl-U`: Clear line of input
* `Ctrl-K`: Clear all after cursor
* `Ctrl-W`: Delete the word before curosr

History:

* `![keyword]`: Put last command about keyword to next command prompt and do nothing
* `!!`: Put whatever the command it is, to the next command prompt and do nothing
* `Ctrl-R`: Open history search
