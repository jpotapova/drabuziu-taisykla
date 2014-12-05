module.exports = (grunt) ->

  grunt.initConfig

    assemble:
      options:
        layout: 'src/hbs/templates/basic.hbs'
        flatten: true
      app:
        files:
          app: 'src/hbs/pages/*.hbs'


  grunt.loadNpmTasks 'assemble'
  grunt.loadNpmTasks 'grunt-contrib-csslint'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-jshint'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-scss-lint'

  grunt.registerTask 'default', ['assemble']
