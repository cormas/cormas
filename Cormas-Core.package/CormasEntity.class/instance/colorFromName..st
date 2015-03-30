- utilities - color
colorFromName: aName
	"return a specific color from a name"
	
	| tot |
	tot := 0.
	aName asArray do: [:i | tot := tot + i asInteger].
	^self colorOfNumber: (tot * 40 quo: 36)