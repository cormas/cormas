adding
addProbe: probeName ofClass: className
	| ds yValues xValues cn pn |
	probeNum := probeNum + 1.
	cn := className asString.
	pn := probeName asString.
	yValues := [ :x | ((cormasModel data at: cn) at: pn) asOrderedCollection at: x + 1 ].
	xValues := 0 to: ((cormasModel data at: cn) at: pn) asOrderedCollection size - 1 by: 1.
	ds := RTData new.
	"ds noDot."
	ds dotShape circle color: Color blue trans.
	ds points: xValues.
	ds y: yValues.
	ds x: #yourself.
	ds connectColor: (Color colorFrom: (Color defaultColors2 at: 1 + (4 * probeNum))).
	"self halt."
	self add: ds