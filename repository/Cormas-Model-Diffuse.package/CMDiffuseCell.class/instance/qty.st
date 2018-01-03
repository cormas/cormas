accessing
qty
	"Getter accessor with default value = 0 "

	qty isNil
		ifTrue: [ qty := 0 ].
	^ qty