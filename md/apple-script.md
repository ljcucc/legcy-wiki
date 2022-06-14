---
title: Apple Script
public: true
...

> Want to write pure Apple Script Automation? this might help: [How to automate your keyboard in Mac OS X with AppleScript](https://eastmanreference.com/how-to-automate-your-keyboard-in-mac-os-x-with-applescript)

Apple script is an scripting language specific for macOS for scripting and automation. 

The Apple Script also have JavaScript variant (which support JavaScript syntax and AppleScript API), and it's recommended to use JavaScript since there's a lot of documents about JavaScript tutuorial, and Apple Script's syntax is more confused.

> You can read more about AppleScript on [official archived document](https://developer.apple.com/library/archive/documentation/AppleScript/Conceptual/AppleScriptLangGuide/introduction/ASLR_intro.html)

To get started, open **Script Editor** on mac, then switch AppleScript to JavaScript at the top-left menu. when finished your script, click :hammer: icon to build and check syntax (which will update syntax highlight), then click run button to start.

# Automatic

Type words:

```js
var sys = Application("System Events");
sys.keystroke("text you want to type in");
```

Key press:

```js
var sys = Application("System Events");
sys.keyCode(36, {using: []}); // 36: Enter / Return
```

Delays:

```js
var sys = Application("System Events");
sys.keystroke("text you want to type in");
delay(0.5); // delay 0.5 sec
sys.keyCode(36, {using: []}); // 36: Enter / Return
```

Focus on a application:

```js
var app = Application("Discord");
app.activate();
```

Example: Type Hydra music bot command on discord to add music to playlist:

```js
var sys = Application("System Events");

var playlist = `https://datashat.net/music_for_programming_64-strepsil.mp3
https://datashat.net/music_for_programming_63-t-flx.mp3
https://datashat.net/music_for_programming_62-out-grey-lives.mp3
https://datashat.net/music_for_programming_62-our_grey_lives.mp3
https://datashat.net/music_for_programming_61-linnley.mp3
https://datashat.net/music_for_programming_60-tundra.mp3
...
https://datashat.net/music_for_programming_3-datassette.mp3
https://datashat.net/music_for_programming_2-sunjammer.mp3
https://datashat.net/music_for_programming_1-datassette.mp3`;

playlist = playlist.split("\n");

const activeChar = '!';

var app = Application("Discord");
app.activate();

for(var index in playlist){
  var item = playlist[index];

  delay(2);
  sys.keystroke(`${activeChar}play ${item}`);

  sys.keyCode(36, {using: []});
}

```