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
					'less'
				]

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

	# Register our Grunt tasks.
	grunt.registerTask 'run',				 ['less', 'cssmin', 'watch:less']
	grunt.registerTask 'default',			 ['run']
