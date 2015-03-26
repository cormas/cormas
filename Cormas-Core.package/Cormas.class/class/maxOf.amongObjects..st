+ utilities - mathematics
maxOf: aMagnitudeName amongObjects: aCollection
	"Purpose: returns the highest value of a given function among a collection of objects understanding this function
Arguments: aName = <ByteSymbol>
			aCollection = <Collection(Object)>
Return value: <Magnitude>
Example: Cormas maxOf: #elevation amongObject: self theCells"
	
	| collec |
	collec := aCollection
		select: [:c | (c perform: aMagnitudeName) respondsTo: #>].
	^collec isEmpty
		ifFalse: [self max: (collec collect: [:c | c perform: aMagnitudeName])]
		ifTrue: [nil]