module.exports = class Point

	constructor: (@x, @y) ->

		@paths = []

	addPath: (path) ->

		@paths.push path

	updatePaths: ->

		for path in @paths

			path.updateMe()

		return

	setX: (@x) ->

		do @updatePaths

	setY: (@y) ->

		do @updatePaths