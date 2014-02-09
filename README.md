(work in progress)

current phase playground:

	SvgCurver = require 'SvgCurvy'

	svgCurver = new SvgCurver document.body, 200, 2100

	curve = svgCurver.newCurve {leftPointX: 200, leftPointY: 100, rightPointX: 1391, rightPointY: 0}, {leftHandlerX: 422, leftHandlerY: 50, rightHandlerX: 400, rightHandlerY: 20}

	curve2 = svgCurver.newCurve {rightPointX: 1491, rightPointY: 200}, {leftHandlerX: 422, leftHandlerY: 50, rightHandlerX: 1000, rightHandlerY: 200}

	curve3 = svgCurver.newCurve {leftPointX: 200, leftPointY: 100, rightPointX: 1491, rightPointY: 200}, {leftHandlerX: 10, leftHandlerY: 50, rightHandlerX: 700, rightHandlerY: 20}