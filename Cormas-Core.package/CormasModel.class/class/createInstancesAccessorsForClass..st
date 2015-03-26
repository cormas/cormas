compiling
createInstancesAccessorsForClass: aClass
	
	| pop |
	pop := self getterForEntityClass: aClass.
	aClass isAbstract
		ifTrue:
			[self
				compile:
					(pop ,
							'\	"Returns a collection of all the instances of aClass (and sub classes) collected by cormasModel.\'
						, Cormas automaticCommentString , ' "\\   ^self allTheEntities: '
						, aClass name asString) withCRs
				classified: 'accessing'
				notifying: nil]
		ifFalse:
			[self addInstVarName: pop.
			self createReaderAccessor: aClass.
			self createSetterAccessor: aClass]