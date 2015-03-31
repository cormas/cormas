+ environment - sensing - space
myCSE: aClassOrClassName
	"Purpose: returns the instance of a given higher level spatialEntity the receiver belongs to.
Argument:  aClassOrClassName can be an entity class or the name of an entity <ByteSymbol>
Return value: <SpatialEntitySet | nil>
Example: self myCSE: Forest
Example: self myCSE: #Plot"
	
	| aClassName |
	aClassOrClassName isSymbol
		ifTrue: [aClassName := aClassOrClassName]
		ifFalse: [aClassName := aClassOrClassName name].
	^((self theCSE includesKey: aClassName) not
		or: [(self theCSE at: aClassName) isNil])
		ifTrue: [nil]
		ifFalse: [self theCSE at: aClassName]