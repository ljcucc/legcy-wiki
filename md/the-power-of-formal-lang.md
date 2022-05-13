---
title: 用抽象語言建構世界
...

> 接下來的筆記有很大一部分都會引用一本叫做 「Introduction to Mathematical thinking」，中文叫做「這個問題，你用數學方式想過嗎？」的一本書，書中介紹了很多Formal Language的使用方式、概念和定義，非常推薦買一本或者通靈看看。

在閱讀完 [[想法表達、保存的前世今身]] 後，我們初步認識了一個可以把知識壓縮並且重複利用的概念。也就是，我們就可以透過這個強大的力量去描述我們身處的宇宙。同時，是否我們也可以反過來，利用這個強大的力量去建構一個世界或宇宙 ? 例如 [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway's_Game_of_Life)...

## 所以在一開始，容許我先讓我介紹這遠古、強大的力量是如何去建構一個全新的世界吧

首先先來看看這部演講，或許這個影片可以讓你從中啟發一些對數學和計算機科學的好奇心。在這個影片中有提到 [Conway's Game of Life](https://en.wikipedia.org/wiki/Conway's_Game_of_Life)：

<iframe width="560" height="315" src="https://www.youtube.com/embed/6avJHaC3C2U" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

讓我們想像有一個2D的平面，佈滿網格像素，每個空間中的像素有兩種狀態 —— 1、代表有生命（Cell），0、代表無生命、空的。其中這個世界有幾條物理特性：

1. Cell 害怕孤獨，如果 Cell 四面八方 有 0、1個 Cell的話（ Numbers of Cell < 2），Cell 會死去（即當Cell所在Pixel從1轉為0）。
2. 如果 Cell 的 四面八方有 2、3個Cell 的話，那當前的 Cell 得以存活
3. Cell 也害怕擁擠，如果一個Cell的 四面八方有超過 4 個以上（包含）的 Cell，那當前的Cell就會死亡。
4. Cell 也會繁殖，如果今天 一個死亡的Cell或空的地方（即 當前 Pixel 為 0），且 四面八方剛剛好有3個Cell，那當前Cell就會復活（或指Pxiel轉為1）

且世界將以每一輪更新狀態。

光是這幾條規則，很多玩家就開始想出各種可能，例如組出一個邏輯電路、做一個顯示器、做一台圖靈完備的電腦，或 9:30 分提到的，用 Game of Life 建構一個 Game of Life。可是要注意！在Game of Life在1970數學人學刊發刊的初期，大家也僅僅只用了紙和筆就創造了這個宇宙，是到後來個人電腦漸漸的普及，Game of Life才開始數位化。

從這個例子裡我們可以體會到這種概念的強大，就如同書中講到的：

## 「數學讓看不見的得以看見」—— Introduction to Mathematical thinking

計算機同樣繼承了相同的特性與概念，就是因為如此，在日後計算機才能如此的幫助人類透過精準的語言建構虛擬世界。我們也可以利用程式，去幫助我們看見我們以往無法用紙筆看見的世界，也可以同時幫助我們更了解我們的世界。

> 註：在這裡提到的計算機和電腦相同，但計算機設涵各類可以運算裝置。

到這裡你應該可以體會到這種概念的強大，他同時可以是多種具體的事物。他同時可以是個概念、可以是個大條件、可以是個定義、他可以是任何事物！

就如同小說家用自然語言建構一個虛構的時間，計算機科學家利用更嚴謹的語言來建構，使計算機能夠執行，讓虛構化為現實。這也或許是為什麼計算機科學的學生都需要學習這些概念（？）

> 註1: ⚠️ 請務必把影片從 `0:00` 看到 `10:00` ，裡面才會有比上述更詳細的描述

> 註2: Conway's Game of Life在這裡就簡稱為 Game of Life