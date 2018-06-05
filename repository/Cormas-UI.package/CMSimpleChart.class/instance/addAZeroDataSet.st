initialization
addAZeroDataSet
	| yValues xValues ds |
	yValues := [ 0 ].
	xValues := {0} asOrderedCollection.
	ds := RTData new.
	ds dotShape circle color: Color blue trans.
	ds points: xValues.
	ds y: yValues.
	ds x: #yourself.
	ds connectColor: Color blue.
	self add: ds