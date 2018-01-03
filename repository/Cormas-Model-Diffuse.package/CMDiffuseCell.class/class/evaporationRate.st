accessing
evaporationRate
	"Getter accessor with default value = 0.1 "

	evaporationRate isNil
		ifTrue: [ evaporationRate := 0.1 ].
	^ evaporationRate