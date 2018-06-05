deprecated
updateProbe: probeName ofClass: className
	| ds yValues xValues cn pn |
	self halt. "this method does not work"
	cn := className asString.
	pn := probeName asString.
	yValues := [ :y | ((cormasModel data at: cn) at: pn) asOrderedCollection at: y + 1 ].
	xValues := 0 to: ((cormasModel data at: cn) at: pn) asOrderedCollection size - 1 by: 1.


	"	ds dotShape circle color: Color blue trans."
	ds := self datasets first.
	ds addPoint: xValues last.
	ds maxX: ds maxX + 1.
	xValues setFrom: 0 to: xValues last + 1 by: 1.
	"self halt."
	ds y: yValues.
	ds x: #yourself
	"	ds connectColor: (Color colorFrom: (Color defaultColors2 at: 1 + (4 * probeNum)))"

	"self add: ds"