
[CoffeeScript]: http://coffeescript.org
[CoffeeLint]: http://www.coffeelint.org
[grunt-init]: http://gruntjs.com/project-scaffolding
[Mocha]: http://mochajs.org/
[Webpack]: http://webpack.github.io/
[Karma]: http://karma-runner.github.io/

# grunt-init-coffee-node-web

> Create a Node.js/Web module with [grunt-init][].

* [CoffeeScript][] compilation (including tests!).
* [Karma][] test suite with [Mocha][] configured for both browser and Node.js testing!
* [Webpack][] packages dev and minified versions for including via `<script>` tags and provides packing functionality for [Karma][].

## Directory structory

```
  ├── coffeelint.json                    - config CoffeeLint
  ├── coverage.html                      - output from test:coverage
  ├── dist                               - created by build:all
  │   ├── name.js
  │   └── name.min.js
  ├── Gruntfile.coffee                   - grunt entry point
  ├── karma.conf.js                      - config for Karma
  ├── package.json                       - generated with dev deps, name, etc
  ├── README.md                          - sample README
  ├── src
  │   ├── lib
  │   │   └── name.coffee                - sample library
  │   └── test
  │       ├── helpers
  │       │   ├── common-header.coffee   - included in all tests
  │       │   ├── header.coffee          - included in Mocha unit tests
  │       │   └── header-cov.coffee      - included in Mocha coverage tests
  │       └── spec
  │           └── name.coffee            - sample test spec for Mocha
  ├── webpack.config.coffee              - for creating dist/name.js
  └── webpack.dist.config.coffee         - for creating dist/name.min.js

```

## Basic commands

* grunt build          - Build JS files from the [CoffeeScript][]
* grunt build:all      - Also build `dist/$name.js` and `dist/$name.min.js` for browser including.
* grunt test           - Runs [CoffeeLint][] and Mocha tests in terminal.
* grunt test:all       - Also runs [Karma][] tests.
* grunt test:coverage  - creates coverage.html and launches veiwer (Web Browser)
* grunt                - same as `grunt test`

See also `grunt -h`

## Installation
If you haven't already done so, install [grunt-init][].

Once grunt-init is installed, place this template in your `~/.grunt-init/` directory. It's recommended that you use git to clone this template into that directory, as follows:

```
git clone https://github.com/gruntjs/grunt-init-coffee-node-web.git ~/.grunt-init/coffee-node-web
```

_(Windows users, see [the documentation][grunt-init] for the correct destination directory path)_

## Usage

At the command-line, cd into an empty directory, run this command and follow the prompts.

```
grunt-init coffee-node-web
```

_Note that this template will generate files in the current directory, so be sure to change to a new directory first if you don't want to overwrite existing files._

## See Also

* [grunt-init][]
* [Karma][]
* [Mocha][]
* [Webpack][]
* [CoffeeScript][]
* [CoffeeLint][]
