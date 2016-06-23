require! \browserify
require! \gulp
require! \gulp-streamify
require! \gulp-uglify
source = require \vinyl-source-stream

gulp.task \dist, ->
    browserify standalone: \bufferBrowserify, debug: false
        .add <[./index.js]>
        .exclude \assert
        .exclude \base64-js
        .bundle!
        .pipe source \index.min.js
        .pipe (gulp-streamify gulp-uglify!)
        .pipe gulp.dest \./dist