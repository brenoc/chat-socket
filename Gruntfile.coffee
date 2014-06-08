module.exports = (grunt) ->
  config=
    concat:
      css:
        files:
          # add your css files over here to concatenate all css files
          # let's save our site users some bandwith
          src: ['public/vendor/bootstrap/dist/css/bootstrap.min.css', 'public/css/styles.min.css']
          dest: 'public/css/app.styles.min.css'
    uglify:
      options:
        mangle:
          except: ['jQuery']
      target:
        # add your js files over here to minify them into one javascript source file
        'public/js/app.min.js': ['public/vendor/jquery/dist/jquery.min.js', 'public/vendor/bootstrap/dist/js/bootstrap.min.js', 'public/js/main.js']
    coffee:
      src:
        files: [
          {
            expand: true
            cwd: 'models'
            src: '**/*.coffee'
            dest: 'models'
            ext: '.js'
          },
          {
            expand: true
            cwd: 'routes'
            src: '**/*.coffee'
            dest: 'routes'
            ext: '.js'
          },
          {
            expand: true
            cwd: 'controllers'
            src: '**/*.coffee'
            dest: 'controllers'
            ext: '.js'
          },
          {
            expand: true
            cwd: 'public/coffee'
            src: '**/*.coffee'
            dest: 'public/js'
            ext: '.js'
          }
        ]
    less:
      src:
        files: [{
          expand: true
          cwd: 'public/less'
          src: '**/*.less'
          dest: 'public/css'
          ext: '.css'
        }]
    cssmin:
      src:
        files: [{
          expand: true
          cwd: 'public/css'
          src: '**/*.css'
          dest: 'public/css'
          ext: '.min.css'
        }]
    'node-inspector':
      options:
        'save-live-edit': true
    watch:
      all:
        files: ['public/**/*', 'views/**', '!**/node_modules/**', '!public/vendor/**/*', '!**/*.min.*']
        options:
          livereload: true
      scripts:
        files: 'public/js/**/*.js'
        tasks: ['uglify']
      coffee:
        files: ['public/coffee/**/*.coffee', 'controllers/**/*.coffee', 'models/**/*.coffee', 'routes/**/*.coffee']
        tasks: ['coffee']
      less:
        files: ['public/less/**/*.less']
        tasks: ['less', 'cssmin', 'concat:css']
    concurrent:
      tasks: ['node-inspector', 'watch']
      options:
        logConcurrentOutput: true
        limit: 3

  @initConfig config

  # Load the tasks

  require('matchdep').filterDev('grunt-*').forEach @loadNpmTasks
  @registerTask 'default', ['uglify', 'coffee', 'less', 'cssmin', 'concat:css', 'concurrent']
