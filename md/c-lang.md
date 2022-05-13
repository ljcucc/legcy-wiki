---
title: How to basic a C program - note
...

> All Copyright (c) belongs to ljcucc 2021

this guideline (or note) will focusing on "how to write C codes to build a project"

在這個指南(同時也是我的筆記)中會有很多有關C的一些細節，如果你是因為老師在學校有教C，然後覺得C很好玩你很想要用C寫一些東西的人，這個guideline很歡迎你。為了幫助你學習，很多部分都用英文的，絕對不是因為我懶著切換輸入法。

## Entry of the journey

這個筆記會很著重在如何脫離IDE，並且使用非IDE的環境開發。甚至推薦你直接使用terminal，完全脫離GUI。這對你來說是件好事，畢竟在這個過程中你會逐漸了解整個專案背後的原理和細節。

## Pros and Cons

為什麼要用C寫programs和tools？

1. 效率：和使用Golang和Rust一樣，使用C可以提高程式的效率，因為如果你的C是跑在原生的環境上，你不需要為那個python的VM多跑一層，浪費效率。在伺服器上每一行指令都是一個執行成本，多執行就是多成本。
2. CLI tools: 如果你是Terminal/TUI program的愛用者，那你一定知道CLI tools的方便，如果你是個網頁前端的開發者，你一定會體會到有很多程式都是以CLI tools的形式存在的。對大多數學校教的C programming來說，都是在撰寫CLI program或TUI (Text-based user interface)，相比GUI，TUI只需要在乎input和output就好了，大多數不用考慮GUI Framworks、跟X server的溝通，畫面的渲染、事件程式等等的問題，所以多數老師的教學或初學者在開始學習C時常常會從（或幾乎）用TUI作為開頭。
3. 精簡：C是一個很精簡的程式語言，C當初的設計目的就是爲了越接近硬體，越精簡越好。 (待修正)

> * TUI: Text-based User Interface
> * CLI: Command Line Interface

那用C寫有什麽缺點？

1. Pointer 讓記憶體的操作出現了危險性，最著名的例子就是scanf的security issue。(待修正)
2. 抽象程度不高、不支援語言内 OOP 物件導向。但你可以用struct加functions來實作OOP架構。

### 用純C寫例子

總和以上兩點，如果你用C寫出來的程式可以是非常輕量的（在檔案大小和對算力的需求下），所以對low-end device 非常的友善，例如：

* [suckless software](https://suckless.org): suckless一直想要達成的理念，所以suckless的無論是DWM (Dynamic Window Manager)還是ST(Terminal)都是用純C寫的，甚至要變更config需要到source code裡改完,非常的suckless風。
* 100r.co: 100r是一個兩人組成的小團隊，主要致力於開發low-end device的新型態應用程式，他們的網站初期版本就是用C生成的（現在則是用TAL，一種強形態組合語言）

## Recommended Sites

* [Computer Science from the Bottom Up](https://www.bottomupcs.com): This website is focusing on most computer science topic, but not really talk about details that how to wirte codes or develop of a project.
* https://users.ece.cmu.edu/~eno/coding/CCodingStandard.html Coding Standards of C ( and C++ within another webpage)
* 你所不知道的C語言（系列講座）：https://hackmd.io/@sysprog/c-programming

### Recommended Posts and Articles

* how to write GUI application in C programming language, powered by RaspberryPi.org : https://magpi.raspberrypi.com/books/c-gui-programming
* Input / Output (輸入輸出): [https://hackmd.io/@combo-tw/r19DJIRBr]
* gotop 的 21st Century C, 2nd Edition 中文版試讀（前言）：http://epaper.gotop.com.tw/PDFSample/A595.pdf

### 延申閲讀

* Golang 深入淺出：https://hackmd.io/@ljcucc/golang

# Main program

this is a main program without any arguments:

```c=
#include <stdio.h>
#include <stdlib.h>

int main(void){
  // your code here...
  return 0;
}
```

you may see some codes will written like this:

```c=
int main(void){
  // something in your main function...
  exit(0);
}
```