module.exports = (grunt) ->
  
  # Project configuration.
  pkg = require './package.json'
  grunt.initConfig
    pkg: pkg

    coffeelint:
      options:
        configFile: 'coffeelint.json'
      gruntfile:
        src: "Gruntfile.coffee"
      lib:
        src: ["src/lib/**/*.coffee"]
      test:
        src: ["src/test/**/*.coffee"]

    blanket:
      lib:
        files:
          'lib-cov/': ['lib/']

    clean:
      #coverage: ['coverage.html']
      libcov: ['lib-cov/']
      lib: ["lib/"]
      test: ["test*"]

    coffee:
      lib:
        expand: true
        cwd: "src/lib/"
        src: ["**/*.coffee"]
        dest: "lib/"
        ext: '.js'

    concat:
      test:
        src: [
          "src/test/helpers/header.coffee"
          "src/test/helpers/common-header.coffee"
          "src/test/spec/**/*.coffee"
        ]
        dest: "test/spec.coffee"
      testCov:
        src: [
          "src/test/helpers/header-cov.coffee"
          "src/test/helpers/common-header.coffee"
          "src/test/spec/**/*.coffee"
        ]
        dest: "test/spec-cov.coffee"

    karma:
      unit:
        configFile: "./karma.conf.js"

    cafemocha:
      options:
        ui: 'bdd'
      unit:
        options:
          reporter: "spec"
          require: 'coffee-script/register'
        src: 'test/spec.coffee'
      coverage:
        options:
          coverage: true
          reporter: "html-cov"
          require: 'coffee-script/register'
        src: 'test/spec-cov.coffee'
# "..., if you wish to have your tests fail if it
# falls below a certain coverage threshold then I advise using the travis-cov
# reporter"
#      'travis-cov':
#        options:
#          reporter: 'travis-cov'
#        src: 'lib-cov/**\/*.js'
    open:
      coverage:
        path: "./coverage.html"

    webpack:
      dist: require "./webpack.dist.config.coffee"
      dev: require "./webpack.config.coffee"

    watch:
      gruntfile:
        files: "<%= coffeelint.gruntfile.src %>"
        tasks: ["coffeelint:gruntfile"]
      lib:
        files: "<%= coffeelint.lib.src %>"
        tasks: [
          "coffeelint:lib"
          "coffee:lib"
          "cafemocha:unit"
        ]
      test:
        files: "<%= coffeelint.test.src %>"
        tasks: [
          "coffeelint:test"
          "concat"
          "cafemocha:unit"
        ]


  # These plugins provide necessary tasks.
  grunt.loadNpmTasks "grunt-webpack"
  grunt.loadNpmTasks "grunt-karma"
  grunt.loadNpmTasks "grunt-cafe-mocha"
  grunt.loadNpmTasks "grunt-blanket"
  grunt.loadNpmTasks "grunt-coffeelint"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-clean"
  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-open"

  grunt.registerTask "test:coverage", [
    "build"
    "blanket"
    "cafemocha:coverage"
    "open:coverage"
    "clean:libcov"
  ]
  grunt.registerTask "test:all", [
    "test"
    "karma"
  ]
  grunt.registerTask "test", [
    "build:all",
    "cafemocha:unit"
  ]

  grunt.registerTask "build:all", [
    "build"
    "concat"
    "webpack"
  ]
  grunt.registerTask "build", [
    "coffeelint"
    "clean"
    "coffee"
  ]
  # Default task.
  grunt.registerTask "default", [
    "coffeelint"
    "test"
  ]
  return

