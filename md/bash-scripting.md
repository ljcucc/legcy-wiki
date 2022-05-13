---
title: Bash Scripting
...

用 bash scripting 發揮你的最大效率

> 這個頁面尚未完成編輯！

### 什麼是 Bash？

bash 是一種 [shell](https://zh.wikipedia.org/zh-tw/%E6%AE%BC%E5%B1%A4) ，簡單來說就是幫助我們跟內核溝通的一個軟體。

在 mac 上想要使用 Terminal 即在 Spotlight 中搜尋或在 launchpad 中尋找 Terminal 即可。在 Linux 中開啟相對應系統中的 Terminal 。在 Windows 中 Bash Scripting 可能不適用，可以參考 [Intro to C dev](./c-lang.html) 了解更多。

> 什麼是 Terminal 呢？看看這篇文章：[Intro to Terminal](./intro-2-terminal.html) 和 [Intro to C dev](./c-lang.html)

### 簡單的 Bash Scripting

進到 Terminal 你可能會看到這個畫面： ~~(下圖為沒有裝任何 zsh 套件的 mac 為例)~~

```
% 
```

你可能會看到動感光標正在閃動... 接下來你就可以向這個光標 key 入指令，例如...

* `pwd`: 列出你當前訪問的位置，好比你在「檔案總管」或「finder」當前開啟的資料夾的概念
* `ls`: 列出當前資料夾中的所有檔案或資料夾
* `ls ./dir/`: 列出dir資料夾中的所有檔案或資料夾
* `cd ./dir/`: 進去其資料夾
* `touch file.txt`: 創建一個空文件
* `mkdir new_folder`: 創建一個新的資料夾
* `rm file_name`: 刪除一個檔案
* `rm -rf folder_name`: 刪除一個資料夾
* `cp file_name`: 複製一個檔案
* `cp -rf folder_name`: 複製一個資料夾
* `nano file_name`: 用 nano 文字編輯一個檔案 （新手友善）
* `vim file_name`: 用 vim 文字編輯一個檔案 (老手推薦)

> 新手注意：不要複製到冒號了

### 開始撰寫 bash 腳本

你在 Terminal 中輸入的每個指令其實都是 bash 的程式喔。

```
# 這個是註解
$ touch my_script.sh

# 使用 vim 文字編輯器開啟
$ vim my_script.sh
```