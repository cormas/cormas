accessing
minimunState
	"Getter accessor with default value = 1 "

	minimunState isNil
		ifTrue: [ minimunState := 1 ].
	^ minimunState