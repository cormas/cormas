util
createAccessors: aName
	
	| class |
	self listEntities selection notNil
		ifTrue:
			[class := self listEntities selection = 'Global'
				ifTrue: [self cormasModel]
				ifFalse:
					[self cormasModel environment at: self listEntities selection asSymbol].	"class addInstVarName: aName."
			class
				compile: (aName , '\^' , aName) withCRs
				classified: 'accessing'
				notifying: nil.
			class
				compile: (aName , ': x\' , aName , ' := x') withCRs
				classified: 'accessing'
				notifying: nil]