# Grunt Configuration
# http://gruntjs.com/getting-started#an-example-gruntfile

module.exports = (grunt) ->

	# Initiate the Grunt configuration.
	grunt.initConfig

		# Allow use of the package.json data.
		pkg: grunt.file.readJSON('package.json')

		# compile less
		less:
			production:
				files: [
					"txt.css": "txt.less"
				]
		cssmin:
			options:
				sourceMap: true
			target:
				files: [
					"txt.min.css": "txt.css"
				]

		# track changes
		watch:
			less:
				files: ['txt.less']
				tasks: [
					'less:production'
					'notify:less'
				]

		# start server
		connect:
			server:
				options:
					port: 9778
					hostname: '*'
					base: '<%= docpad.out %>'
					livereload: true
					# open: true

		# notify
		notify:
			less:
				options:
					title: 'LESS'
					message: 'txt.css compiled'

	# measures the time each task takes
	require('time-grunt')(grunt);

	# Build the available Grunt tasks.
	grunt.loadNpmTasks 'grunt-contrib-clean'
	grunt.loadNpmTasks 'grunt-contrib-imagemin'
	grunt.loadNpmTasks 'grunt-contrib-copy'
	grunt.loadNpmTasks 'grunt-contrib-less'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-contrib-connect'
	grunt.loadNpmTasks 'grunt-contrib-cssmin'
	grunt.loadNpmTasks 'grunt-shell-spawn'
	grunt.loadNpmTasks 'grunt-newer'
	grunt.loadNpmTasks 'grunt-notify'

	# Register our Grunt tasks.
	grunt.registerTask 'run',				 ['less', 'cssmin', 'notify:less', 'watch:less']
	grunt.registerTask 'default',			 ['run']
