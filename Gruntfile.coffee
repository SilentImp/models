module.exports = (grunt)->
	grunt.initConfig
		watch:
			coffee:
				files: 'coffee/*.coffee'
				tasks: 'coffee'
			compass:
				files: 'sass/*.scss'
				tasks: 'compass'
			haml:
				files: '*.haml'
				tasks: 'haml'
			concat: 
				files: [
					'css-separate/*.css'
					'js-separate/*.js'
				]
				tasks: 'concat'
			uglify:
				files: 'js-separate/*.js'
				tasks: 'uglify'
			cssmin:
				files: 'css-separate/*.css'
				tasks: 'cssmin'
		haml:
			default:
				files:[
					src: '*.haml'
					ext: '.html'
					expand: yes
				]
		compass:
			default:
				options:
					httpGeneratedImagesPath: '../images/'
					sassPath: 'sass'
					cssPath: 'css-separate'
					outputStyle: 'expanded'
					require: 'sass-globbing'
		coffee:
			default:
				files:[
					src: ['*.coffee']
					cwd: 'coffee'
					flatten: true
					ext: '.js'
					dest: 'js-separate'
					expand: yes
				]
		concat:
			css:
				src: 'css-separate/*.css'
				dest: 'css/common.css'
			js:
				src: 'js-separate/*.js'
				dest: 'js/scripts.js'
		uglify:
			default:
				files:
					'js/scripts.js': '<%= concat.js.dest %>'
		cssmin:
			default:
				files:
					'css/common.css': '<%= concat.css.dest %>'



	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-contrib-compass'
	grunt.loadNpmTasks 'grunt-contrib-cssmin'
	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-concat'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-contrib-haml'


	grunt.registerTask 'default', ['watch']