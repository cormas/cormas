accessing
diffusionRate
	"Getter accessor with default value = 50 % "

	diffusionRate isNil
		ifTrue: [ diffusionRate := 0.5 ].
	^ diffusionRate