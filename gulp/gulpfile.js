// Gulp v4

// plugins
const gulp         = require('gulp');
const sass         = require('gulp-sass');
const plumber      = require('gulp-plumber');
const notify       = require('gulp-notify');
const browserSync  = require('browser-sync');
const autoprefixer = require('gulp-autoprefixer');
const cmd          = require('child_process').exec;
const php          = require('gulp-connect-php');

const paths = {
	'scss': './src/sass/',
	'css' : './docs/css/',
	'html': './docs/',
	'js'  : './docs/scripts/'
}

const connectOptions = {
	port: 8001,
	base: './docs/'
}

// browser-sync options
const bsOptions = {
	server: { baseDir: paths.html },
	proxy: 'localhost:8001'
	// tunnel: true // 外部テスト用	
}

// sass options
const sassOptions = {
	indentType: 'tab',
	linefeed: 'crlf',
	outputStyle: 'expanded'
}

// browserSync load
const reload = done => {
	browserSync.reload();
	done();
};


// scss tasks
gulp.task('scss', () => {
	return gulp.src(paths.scss + '**/*.scss')
		.pipe(plumber({
			// errorHandler: notify.onError("Error: <%= error.message %>")
			errorHandler: cmd('toast -Text "Error: <%= error.message %>"')
		}))
		.pipe(sass(sassOptions))
		.pipe(autoprefixer({remove:false}))
		.on('error', sass.logError)
		.pipe(gulp.dest(paths.css));
});


//Browser Sync
gulp.task('browser-sync', () => {
	php.server(connectOptions, () => {
		browserSync(bsOptions)});
	gulp.watch(paths.js + '**/*.js', reload);
	gulp.watch(paths.html + '**/*.html', reload);
	gulp.watch(paths.css + '**/*.css', reload);
});
// gulp.task('reload', () => {
// 	browserSync.reload();
// });

// watch
gulp.task('watch', () => {
	gulp.watch(paths.scss + '**/*.scss', gulp.task('scss'));
});

gulp.task('default', gulp.parallel('browser-sync', 'watch'));