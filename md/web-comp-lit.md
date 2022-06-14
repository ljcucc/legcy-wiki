---
title: Lit - Web Component
...

<iframe width="560" height="315" src="https://www.youtube.com/embed/QBa1_QQnRcs" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Lit 是一個 [Web Comp](./web-comp) 的函式庫

開始使用 Lit 有 2 種方式：

* 使用 CDN 直接在靜態網頁使用 Lit
* 使用 dev server resolve path of modules

### CDN 方法

直接 paste 這段 code 在 JS module 的最上面：

```js
import {LitElement, html, css} from 'https://cdn.jsdelivr.net/gh/lit/dist@2/all/lit-all.min.js';
```

### Dev server 方法

此作法較有技巧性，首先你需要一個 dev server 來 resolve path of modules。Lit 官方有提供 MordenWeb dev server 的方法，但如果可以你可以使用 webpack 或其他的工具。

# How it works

Lit 的 Element 也可以當作 HTMLElement 做使用，一下是一個 Lit 最基礎的結構：

```js
class MyComp extends HTMLElement{
  render(){
    return html`
      Hello World
    `;
  }
}
```

其中 `html` 的寫法採用了 JS 中的 [Template String](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals)。

> 更多詳細資訊可以參考 Lit 官方手冊： https://lit.dev/docs/

- [ ] Lifecycle
- [ ] Template
- [ ] Styling
- [ ] Loop / List
- [ ] Properties & Attributes
- [ ] Events