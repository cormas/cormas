- displaying
getInfoFor: aSelectorName
	"Returns a String according to the aSelectorName.
aSelectorName = <ByteSymbol>."
	
	| info |
	aSelectorName = #nil ifTrue: [^''].
	aSelectorName ifNil: [^''].
	info := self perform: aSelectorName.
	info isString ifTrue: [^info].
	info isSymbol ifTrue: [^info asString].
	^info printString