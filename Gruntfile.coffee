module.exports = (grunt) ->

  grunt.initConfig

    clean: ["app"]
    assemble:
      options:
        layout: 'src/hbs/templates/basic.hbs'
        flatten: true
      lt:
        options:
          data: [
            'src/hbs/data/lang/lt/*.json',
            'src/hbs/data/dev/env.json'
          ]
        files:
          [
            'app/index.html': 'src/hbs/pages/index.hbs'
            'app/kontaktai/index.html': 'src/hbs/pages/contacts.hbs',
            'app/404.html': 'src/hbs/pages/error.hbs'
          ]
    coffee:
      app:
        files:
          'src/js/main.js': 'src/coffee/main.coffee'
    coffeelint:
      app: 'src/coffee/main.coffee'
      grunt: 'Gruntfile.coffee'
    uglify:
      prod:
        files:
          'app/js/main.js': 'src/js/main.js'
      dev:
        options:
          mangle: false
        files:
          'app/js/main.js': 'src/js/main.js'
    copy:
      libs:
        flatten: true
        expand: true
        cwd: 'src/lib/'
        src: '*.js'
        dest: 'app/js/lib/'
      imgs:
        flatten: true
        expand: true
        cwd: 'src/img/'
        src: ['*.png', '*.jpg', '*.ico']
        dest: 'app/img/'
    jshint:
      app: 'src/js/main.js'
    sass:
      app:
        files:
          'app/css/main.css': 'src/scss/main.scss'
    scsslint:
      app: [
        'src/scss/*.scss'
      ]
    csslint:
      app:
        options:
          import: 2
      src:
        'app/css/main.css'
    watch:
      app:
        files: ['src/**/*.*']
        tasks: ['dev']


  grunt.loadNpmTasks 'assemble'
  grunt.loadNpmTasks 'grunt-contrib-csslint'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-scss-lint'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-uglify'

  grunt.registerTask 'health', [
    'sass'
    'scsslint'
    'csslint'
    'coffeelint'
    'coffee'
    'uglify:dev'
    'jshint'
  ]

  grunt.registerTask 'dev', [
    'assemble'
    'copy'
    'sass'
    'coffee'
    'uglify:dev'
  ]
  grunt.registerTask 'prod', [
    'clean'
    'assemble'
    'copy'
    'sass'
    'coffee'
    'uglify:prod'
  ]
  grunt.registerTask 'default', ['dev', 'watch']
