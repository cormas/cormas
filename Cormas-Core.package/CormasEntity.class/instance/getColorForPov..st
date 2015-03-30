- utilities - color
getColorForPov: aSelectorName
	"Returns a Color according to the POV (aSelectorName).
aSelectorName = <Symbol>.
A color may be define to see an entity on the grid but also on another space (ex: communication space).
aSelectorName could be the name of a method or a Symbol for which an EntityImage is assign"
	
	| aColor |
	aSelectorName ifNil: [^ColorValue veryLightGray].	"aSelectorName is a key for a fixed color defined at the class level"
	(self class colorsDict includesKey: aSelectorName)
		ifTrue:
			[^self class colorsDict
				at: aSelectorName
				ifAbsentPut: [ColorValue veryLightGray]].	"aSelectorName is a method for a changeable color"
	aColor := self perform: aSelectorName.
	aColor class = ColorValue
		ifTrue: [^aColor]
		ifFalse:
			[(ColorValue constantNames includes: aColor)
				ifTrue: [^ColorValue perform: aColor]
				ifFalse:
					[^self class colorsDict
						at: aColor
						ifAbsent: [ColorValue veryLightGray]]]