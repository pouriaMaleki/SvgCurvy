DUM = require 'stupid-dom-interface'
Curvy = require './Curvy'
Point = require './Point'

module.exports = class SvgCurvy

	constructor: (@parent, @height, @width) ->

		@svg = do @_createSvg

		@curvies = []

		@points = []

	_createSvg: ->

		DUM('svg:svg.theatrejs-timelineEditor-prop-pacs-svgArea')
		.attr('height', @height + 'px')
		.attr('width', @width + 'px')
		.inside(@parent)

	searchForPoint: (x, y) ->

		for point in @points

			if point.x is x and point.y is y

				return point

		false

	newCurve: (pointValues, handleValues) ->

		leftPoint = {}
		rightPoint = {}

		if @points.length > 0

			if pointValues.leftPointX? and pointValues.leftPointY?

				foundPoint = @searchForPoint pointValues.leftPointX, pointValues.leftPointY

				if foundPoint

					leftPoint = foundPoint

				else

					leftPoint = new Point pointValues.leftPointX, pointValues.leftPointY

			else

				leftPoint = @points[@points.length - 1]

		else

			leftPoint = new Point pointValues.leftPointX, pointValues.leftPointY

			@points.push leftPoint

		foundPoint = @searchForPoint pointValues.rightPointX, pointValues.rightPointY

		if foundPoint

			rightPoint = foundPoint

		else

			rightPoint = new Point pointValues.rightPointX, pointValues.rightPointY

			@points.push rightPoint

		curvy = new Curvy @svg, leftPoint, rightPoint, handleValues

		@curvies.push curvy

		curvy