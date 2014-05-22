gulp = require 'gulp'
coffee = require 'gulp-coffee'
uglify = require 'gulp-uglify'
rename = require 'gulp-rename'

gulp.task 'coffee', ->
  gulp.src('./src/multi-coloured.coffee')
    .pipe(coffee())
    .pipe(
      gulp.dest('./dist')
    )

gulp.task 'uglify', ->
  gulp.src('./dist/multi-coloured.js')
    .pipe(uglify(output:{comments:true}))
    .pipe(
      rename(
        extname: '.min.js'
      )
    ).pipe(
      gulp.dest('./dist')
    )

gulp.task 'default', [
  'coffee'
  'uglify'
]



