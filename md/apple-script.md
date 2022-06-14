---
title: Apple Script
public: true
...

The Apple Script also support JavaScript, and it's recommended to use JavaScript since there's a lot of documents about JavaScript API more then Apple Script basic syntax.

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