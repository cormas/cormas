accessing
antNumber
	"Getter accessor with default value = 1 "

	antNumber isNil
		ifTrue: [ antNumber := 1 ].
	^ antNumber