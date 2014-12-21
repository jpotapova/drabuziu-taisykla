# www.DrabuziuTaisykla.lt

Source code for a simple, responsive, lightweight, mobile-first and
acessible website http://www.drabuziutaisykla.lt

Built with [assemble](http://assemble.io), [Sass](http://sass-lang.com/),
[CoffeeScript](http://coffeescript.org/), [Grunt](http://gruntjs.com/),
[CasperJs](http://casperjs.org/)

As starting point for the design I used a free website template
[Quietude](http://templates.arcsin.se/quietude-website-template/) by Arcsin.

## Build

### Dependencies

- ruby
- sass
- node.js
- grunt
- python (only for running tests)
- http-server (or any other static website server)

### To build and view the website locally (development version)

1. run `npm install`
2. `grunt dev`
3. navigate to `app` directory and run http-server
4. open `localhost:8080` (if another port/address required, change in `src/hbs/data/dev/env.json`)

### To build production version

1. run `npm install` if you haven't done so
2. `grunt prod`
3. observe created files in `app` directory, these can uploaded to the server

### To validate all the code

`grunt health`

Validates SCSS, CSS, CoffeeScript, JavaScript, runs tests

### To run tests

`grunt test`

Tests are written in CoffeeScript (`tests/coffee/*.coffee`) using Casper.js
To run the tests with Grunt, a Grunt plugin grunt-casperjs is used.
