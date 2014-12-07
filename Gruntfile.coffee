module.exports = (grunt) ->

  grunt.initConfig

    clean: ["app"]
    assemble:
      options:
        layout: 'src/hbs/templates/basic.hbs'
        flatten: true
      lt:
        options:
          data: 'src/hbs/data/lt/*.json'
        files:
          'app/': 'src/hbs/pages/*.hbs'
    coffee:
      app:
        files:
          'app/js/main.js': 'src/coffee/main.coffee'
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
        src: '*'
        dest: 'app/img/'
    sass:
      app:
        files:
          'app/css/main.css': 'src/scss/main.scss'
    csslint:
      app:
        options:
          import: 2
      src:
        'app/css/main.css'
    watch:
      app:
        files: ['src/**/*.js', 'src/**/*.scss', 'src/**/*.hbs', 'src/**/*.json', 'src/**/*.coffee']
        tasks: ['dev']


  grunt.loadNpmTasks 'assemble'
  grunt.loadNpmTasks 'grunt-contrib-csslint'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-clean'

  grunt.registerTask 'dev', ['assemble', 'copy', 'sass', 'csslint', 'coffee']
  grunt.registerTask 'default', ['dev', 'watch']
