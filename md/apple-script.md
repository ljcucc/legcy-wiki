---
title: Apple Script
public: true
...

Apple script is an scripting language specific for macOS for scripting and automation. 

The Apple Script also have JavaScript variant (which support JavaScript syntax and AppleScript API), and it's recommended to use JavaScript since there's a lot of documents about JavaScript API more then Apple Script basic syntax.

> You can read more about AppleScript on [official archived document](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/introduction/ASLR_intro.html)

# Automatic

Type words:

```js
var sys = Application("System Events");
sys.keystroke("text you want to type in");
```

Key press:

```js
var sys = Application("System Events");
sys.keyCode(36, {using: using}); // 36: Enter / Return
```

Delays:

```js
var sys = Application("System Events");
sys.keystroke("text you want to type in");
delay(0.5); // delay 0.5 sec
sys.keyCode(36, {using: using}); // 36: Enter / Return
```

Focus on a application:

```js
var app = Application("Discord");
app.activate();
```