+ utilities - files
matrixInOneLine: aMatrix
	"aMatrix = Coll of collections.
aMatrix =
OrderedCollection (
'a;b;c;d'
'e;f;g;h' 
...)
oneCol = ('a b c d e f g h)"
	
	| oneLine |
	oneLine := OrderedCollection new.
	aMatrix do: [:coll | oneLine addAll: coll].
	^oneLine