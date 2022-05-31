---
title: Web Component & Lit
public: true
...

### Web component 是一個新 web 的標準，Web component是網頁絕對原生支援的可移植的解決方案

<iframe width="560" height="315" src="https://www.youtube.com/embed/xCeutzpRlzA" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

你有嘗試模組化你的網頁部件嗎？例如 Topbar、A login form of dialog、A chart or something, and why it's so hard to modularization a website, for exmpale you need to build the bones up the project in a framework like Vue, Angular or something? So that's why Web Comp got invented. 

From now on, you can build your website by using components without dealing with Frameworks, instead, browser do all the work for you. and because of that (running natively) you can even cross framework if you using web component, or if a component that built in framework was implemented by using web comp, which can be reuse with-in other framework (or without frameowrk).

> 詳細可參考 [MDN 官方文件](https://developer.mozilla.org/en-US/docs/Web/Web_Components)

現在已經有80%以上的瀏覽器支援了，如果不支援也可以使用 Polyfill 支援 Legacy browsers。比起Vue、Angular等Framework，Web Comp 相容於所有Framework。

### Quick Started

在這裡我使用 Lit 函式庫做示範, 下是一個顯示Material icon的 Web Comp：

```
import {LitElement, html, css} from 'https://cdn.jsdelivr.net/gh/lit/dist@2/all/lit-all.min.js';

class Icons extends LitElement{
  static properties = {
    name: {type: String}
  };

  constructor(){
    super();
    this.name = ""; // default value
  }

  render(){
    return html`
      <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
      <i class="material-icons">${this.name}</i>
    `;
  }
}

customElements.define("material-icons", Icons);
```

你可以把這段 JS 當作 script tag import，之後就可以直接使用它了⋯⋯ 就像這樣：

```
<script type="module" src="./icon.js">

...

<material-icons name="menu"></material-icons>
```

你甚至可以在 Vue、React 裡面使用它。

### How it works

為了因應多變的可能情況，Web Comp 基本上分為3個主要元件：

* Custom elements：用於定義 Web Comp，讓 Web Comp 可以原生使用於 HTML
* Shadow DOM：用於保護 Web Comp 範圍內的 styling
* HTML templates：在 HTML 中定義 Web Comp 的模板

### Custom elements & HTML templates

HTML: 
```
<!-- define your template for custom element -->

<template id="my-paragraph">
  <style>
    p {
      color: white;
      background-color: black;
      padding: 5px;
      border-radius: 10px;
    }
  </style>
  <p>Hello World</p>
</template>
```

JavaScript:
```
class MyElement extends HTMLElement{
  constructor() {
    super();
    const template = document.getElementById('my-paragraph'); // get element of template
    const templateContent = template.content;                 // get content of template

    this.attachShadow({mode: 'open'}).appendChild(            // turn on shadow root for protection
      templateContent.cloneNode(true);                        // create copy of template
    );
  }
}

customElements.define('my-paragraph', MyElement);             // define the custom element
```

usage:
```
<my-paragraph></my-paragraph>
```

> ref: https://github.com/mdn/web-components-examples/blob/main/simple-template/main.js