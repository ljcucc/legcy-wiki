---
title: Creative Coding with Processing
public: "true"
...


### The goal of Creative Coding is creating an expressive coding, usually as form as visual, art, design, motion, or games (or mixing with music)

different of Creative Coding is to create something expressive instead of something functional. ( [Wikipedia](https://en.wikipedia.org/wiki/Creative_coding){target="blank"} )

### #つぶやきProcessing

spell as Tsu bu ya ki.

'つぶやきProcessing is a challenge that creates art with Processing under one tweet text length limitation' -- by the founder of '#つぶやきProcessing', @Hau_kun.

> More about :point_right: [#つぶやきProcessing](https://www.deconbatch.com/2020/01/what-is-processing.html)

### Processing is an IDE or library for artist, student and more

Processing originally developed and use Java as programming language, today it have different variants, and JavaScript one is the most easy accessible version of it called `p5.js`

### p5.js

Get web IDE on https://editor.p5js.org, because p5.js is completely run on you browser, so you can directly import library to your web page (https://cdnjs.com/libraries/p5.js).

```html
<!-- import p5js library -->
<script src="./p5js.min.js"></script>
```

the main program should be declared at the root (if you want your ):

```js
function setup(){
  // setup() will run before draw() and only run once
}

function draw(){
  // draw() will run forever
}
```

> you can get all function references from official website: [p5js.org/reference](https://p5js.org/reference/)

You can also simplify the code like this, as the form of #つぶやきProcessing :

```js
t=0;a=10;draw(_)=>{t++||/*your code here*/}
```

here's an example of how:

```js
t=0;r=0.1;g=10;l=10;
draw=(_)=>{t++||createCanvas(w=400, w);background(255);
for(var i = 0; i < Math.round(width/g); i++){
strokeWeight(l-(abs(mouseX-i*g,2))*(r));line(i*g, 0, i*g, height)}}
```
