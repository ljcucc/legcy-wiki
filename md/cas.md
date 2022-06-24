---
title: Computer Algebra System (CAS) 
public: false
...

> 這個頁面尚未完成編輯！

## Computer Algebra System (CAS) 是一個以代數為基礎的運算系統

### Algebrite (JavaScript)

Algebrite is a CAS based on JavaScript. to inject library into your website:

```
<script src="https://unpkg.com/algebrite"></script>
```

Because of Algebrite using the speical internal scripting language, so in order to use it you'll need to deliver a string with the scripting language syntax.

```
Algebrite.run('x + x')
```

the result will be

> \> `2*x`

or using the offical sandbox webpage for testing ideas: http://algebrite.org/sandboxes/latest-stable/sandbox.html