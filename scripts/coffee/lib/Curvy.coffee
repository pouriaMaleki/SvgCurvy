DUM = require 'stupid-dom-interface'
Point = require './Point'

module.exports = class Curvy

	constructor: (@svg, @leftPoint, @rightPoint, @handlerValues) ->

		do @_prepareNodes

		@centerNode = do @_createCenterNode

		@leftPointNode = do @_createPointNode

		@rightPointNode = do @_createPointNode

		@leftHandlerNode = do @_createHandlerNode

		@rightHandlerNode = do @_createHandlerNode

		@leftPointHandlerNode = do @_createHandlerPointNode

		@rightPointHandlerNode = do @_createHandlerPointNode

		do @updateLeft
		do @updateRight

	_prepareNodes: ->

		@leftHandlerPoint = new Point @handlerValues.leftHandlerX, @handlerValues.leftHandlerY

		@rightHandlerPoint = new Point @handlerValues.rightHandlerX, @handlerValues.rightHandlerY

		@leftPoint.addPath @
		@rightPoint.addPath @
		@leftHandlerPoint.addPath @
		@rightHandlerPoint.addPath @

	_createCenterNode: ->

		DUM('svg:path').inside(@svg)
		.attr('stroke', '#367c89')
		.attr('stroke-width', '4px')
		.attr('fill', 'transparent')

	_createPointNode: ->

		DUM('svg:circle.theatrejs-timelineEditor-prop-pacs-point').inside(@svg)
		.attr('cx', '0')
		.attr('cy', '0')
		.attr('r', '4')
		.attr('stroke', '#367c89')
		.attr('stroke-width', '3px')
		# .attr('fill', 'transparent')

	_createHandlerNode: ->

		DUM('svg:path').inside(@svg)
		.attr('stroke', '#272727')
		.attr('stroke-width', '1px')
		.attr('fill', 'transparent')

	_createHandlerPointNode: ->

		DUM('svg:circle.theatrejs-timelineEditor-prop-pacs-point-handler').inside(@svg)
		.attr('cx', '0')
		.attr('cy', '0')
		.attr('r', '3')

	updateLeft: =>

		console.log @leftHandlerPoint

		@leftPointHandlerNode
		.x(@leftHandlerPoint.x)
		.y(@leftHandlerPoint.y)

		@leftPointNode
		.x(@leftPoint.x)
		.y(@leftPoint.y)

		@leftHandlerNode
		.attr('d',

			"M#{@leftPoint.x} #{@leftPoint.y} L " +
			"#{@leftHandlerPoint.x} #{@leftHandlerPoint.y}, "
		)

		@centerNode
		.attr('d',
			"M#{@leftPoint.x} #{@leftPoint.y} C " +
			"#{@leftHandlerPoint.x} #{@leftHandlerPoint.y}, " +
			"#{@rightHandlerPoint.x} #{@rightHandlerPoint.y}, " +
			"#{@rightPoint.x} #{@rightPoint.y}"
		)

	updateRight: =>

		@rightPointHandlerNode
		.x(@rightHandlerPoint.x)
		.y(@rightHandlerPoint.y)

		@rightPointNode
		.x(@rightPoint.x)
		.y(@rightPoint.y)

		@rightHandlerNode
		.attr('d',

			"M#{@rightPoint.x} #{@rightPoint.y} L " +
			"#{@rightHandlerPoint.x} #{@rightHandlerPoint.y}, "
		)

		@centerNode
		.attr('d',
			"M#{@leftPoint.x} #{@leftPoint.y} C " +
			"#{@leftHandlerPoint.x} #{@leftHandlerPoint.y}, " +
			"#{@rightHandlerPoint.x} #{@rightHandlerPoint.y}, " +
			"#{@rightPoint.x} #{@rightPoint.y}"
		)

	updateMe: ->

		do @updateLeft
		do @updateRight

	setLeftPointX: (x) =>

		@leftPoint.setX x

	setLeftPointY: (y) =>

		@leftPoint.setY y

	setRightPointX: (x) =>

		@rightPoint.setX x

	setRightPointY: (y) =>

		@rightPoint.setY y

	setLeftHandlerX: (x) =>

		@leftHandlerPoint.setX x

	setLeftHandlerY: (y) =>

		@leftHandlerPoint.setY y

	setRightHandlerX: (x) =>

		@rightHandlerPoint.setX x

	setRightHandlerY: (y) =>

		@rightHandlerPoint.setY y


	get: =>

		#do nothing
