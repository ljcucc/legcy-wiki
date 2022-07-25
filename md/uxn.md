---
title: Uxn 虛擬機
public: false
...

> This is a page written in Chinese

uxn 虛擬機是一個以實作為目標的VM，以 ANSI C (c99) 實作的uxn也只有100餘行，是個 **設計簡潔但不簡單的VM** 。

* [Guide](/uxn-guide)
* [Reference](/uxn-reference)

# Varvara 架構

> Varvara 是南瓜發出的聲音

uxn 是一個別於 **馮洛伊曼 架構** 的組織，其以 **堆棧 (stack-based)** 為基礎建構的組織。

簡單來說uxn的記憶體分為4大部分：

* **Working stack**: 所有的記憶體操作都在上面
* **Return stack**: 當程式在Jump時紀錄使用
* **Device I/O memory**: uxn在記憶體上的I/O mapping，是uxn操作各種功能的方式，主要對memory的address讀寫操作,和早期6502類似。
* **Main memory**: 主記憶體，存放各種數值和從ROM載入的主程式。

這裡有些名詞在後續可能會看到的：

* **WST**: Working stack
* **RST**: Return stack
* **meomry**: 通指Main memoery
* **uxnemu**:通指Uxn的模擬器(Emulator)
* **uxntal**: Uxn的強型態組語(Uxn Typed assembly language)

當你執行一個uxn的rom時:

1. uxnemu 會從rom載入程式到主記憶體0x0100的位置（即page 01，每個page有256 bytes）
2. uxnemu 執行時，所有載入的「純數值 (Literal)」會被push到Working stack中。
3. 當uxnemu讀到指令為BRK（opcode在binary中即為0x00）即會終止( HALT )。

# 資源

官網：

* uxn XXIIVV 官網：https://wiki.xxiivv.com/site/uxn.html
* uxntal - uxn的程式語言（與基本介紹） (XXIIVV)：https://wiki.xxiivv.com/site/uxntal.html

載點：

* 100r.co官網 https://100r.co/site/uxn.html

參考：

* uxntal 參考文件 (XXIIVV)：https://wiki.xxiivv.com/site/uxntal_reference.html
* uxntal 作弊表 (XXIIVV)：https://wiki.xxiivv.com/site/uxntal_cheatsheet.html
* varvara 參考文件 (XXIIVV)：https://wiki.xxiivv.com/site/varvara.html

論壇：

* uxn 官方論壇：https://llllllll.co/t/uxn-virtual-computer/46103

教學：

* uxn官方支持教學：https://compudanzas.net/uxn_tutorial.html

