+ utilities - files
matrixInOneColumn: aMatrix
	"aMatrix = Coll of collections.
aMatrix =
OrderedCollection (
'a;b;c;d'
'e;f;g;h' 
...)
oneCol = ('a;e;b;f;c;g;d;h)"
	
	| oneCol nbOfCol |
	oneCol := OrderedCollection new.
	nbOfCol := aMatrix first size.
	1
		to: nbOfCol
		do: [:i | aMatrix do: [:coll | oneCol add: (coll at: i)]].
	^oneCol