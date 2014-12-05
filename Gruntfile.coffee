module.exports = (grunt) ->

  grunt.initConfig

    assemble:
      options:
        layout: 'src/hbs/templates/basic.hbs'
        flatten: true
      lt:
        options:
          data: 'src/hbs/data/lt.json'
        files:
          app: 'src/hbs/pages/*.hbs'
    copy:
      libs:
        flatten: true
        expand: true
        cwd: 'src/lib/'
        src: '*.js'
        dest: 'app/js/lib/'

  grunt.loadNpmTasks 'assemble'
  grunt.loadNpmTasks 'grunt-contrib-csslint'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-scss-lint'

  grunt.registerTask 'default', ['assemble', 'copy']
