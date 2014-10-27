/*
 * grunt-init-node-web
 * https://github.com/bline/grunt-init-node-coffee
 *
 * Copyright (c) 2014 "bline" Scott Beck
 * Licensed under the MIT license.
 */

'use strict';

// Basic template description.
exports.description = 'Create a Node.js module, including CoffeeScript and Jasmine unit tests.';

// Template-specific notes to be displayed before question prompts.
exports.notes = '_Project name_ shouldn\'t contain "node" or "js" and should ' +
  'be a unique ID not already in use at search.npmjs.org.';

// Template-specific notes to be displayed after question prompts.
exports.after = 'You should now install project dependencies with _npm ' +
  'install_. After that, you may execute project tasks with _grunt_. For ' +
  'more information about installing and configuring Grunt, please see ' +
  'the Getting Started guide:' +
  '\n\n' +
  'http://gruntjs.com/getting-started';

// Any existing file or directory matching this wildcard will cause a warning.
exports.warnOn = '*';

// The actual init template.
exports.template = function(grunt, init, done) {

  init.process({type: 'node'}, [
    // Prompt for these values.
    init.prompt('name'),
    init.prompt('description'),
    init.prompt('version'),
    init.prompt('repository'),
    init.prompt('homepage'),
    init.prompt('bugs'),
    init.prompt('licenses'),
    init.prompt('author_name'),
    init.prompt('author_email'),
    init.prompt('author_url'),
    init.prompt('node_version', '>= 0.8.0'),
    init.prompt('main'),
    init.prompt('npm_test', 'grunt test'),
    {
      name: 'travis',
      message: 'Will this project be tested with Travis CI?',
      default: 'Y/n',
      warning: 'If selected, you must enable Travis support for this project in https://travis-ci.org/profile'
    },
  ], function(err, props) {
    props.keywords = [];
    props.devDependencies = {
      "coffee-script": "~1.8.0",
      "coffee-loader": "~0.7.2",
      "karma": "~0.12.24",
      "karma-webpack": "~1.3.1",
      "karma-mocha": "~0.1.9",
      "karma-script-launcher": "~0.1.0",
      "karma-chrome-launcher": "~0.1.5",
      "karma-firefox-launcher": "~0.1.3",
      "karma-phantomjs-launcher": "~0.1.4",
      "grunt-blanket": "~0.0.8",
      "grunt-open": "~0.2.3",
      "grunt-cafe-mocha": "~0.1.13",
      "grunt-karma": "~0.9.0",
      "grunt-webpack": "~1.0.8",
      'grunt-coffeelint': '~0.0.13',
      'grunt-contrib-coffee': '~0.12.0',
      'grunt-contrib-clean': '~0.6.0',
      "grunt-contrib-concat": "~0.5.0",
      'grunt-contrib-watch': '~0.5.3',
      'should': '~4.1.0'
    };
    props.travis = /y/i.test(props.travis);

    // Files to copy (and process).
    var files = init.filesToCopy(props);
    if (!props.travis) { delete files['.travis.yml']; }

    // Add properly-named license files.
    init.addLicenseFiles(files, props.licenses);

    // Actually copy (and process) files.
    init.copyAndProcess(files, props);

    // Generate package.json file.
    init.writePackageJSON('package.json', props);

    // All done!
    done();
  });

};
