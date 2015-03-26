+ utilities - save load attributes
saveLocatedAgent: aClass withAttributs: attributes inFile: aStringOrFilename
	"Save the attributes of the intances of aClass (SituatedAgent or LocatedObject) on a file 'aStringOrFilename'  
attributes <OrderedCollection> ex: OrderedCollection ('seed' 'context')
file <Filename> ex: aFATFilename('d:\vw7nc\cormas\Models\TSE\data\titi.txt') or
file <String> ex: 'titi.txt'  it will be save into data/"
	
	attributes add: 'patchID'.
	self saveAttributes: attributes fromClass: aClass inFile:
			aStringOrFilename