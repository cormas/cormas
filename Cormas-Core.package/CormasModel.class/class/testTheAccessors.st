compiling
testTheAccessors
	"test if reader and setter accessors exist for each terminal class (and if readerAccessors contains IndexedSet), otherwise it recompiles new code"
	
	| accessor |
	self allClasses
		do:
			[:aClass | 
			aClass isAbstract
				ifFalse:
					[accessor := self getterForEntityClass: aClass.
					(self canUnderstand: accessor)
						ifFalse: [self createInstancesAccessorsForClass: aClass].
					(self allInstVarNames includes: accessor asString)
						ifFalse: [self createInstancesAccessorsForClass: aClass].
					((self sourceCodeAt: accessor) string indexOfSubCollection:
							'IndexedSet' startingAt: 1) = 0
						ifTrue: [self createInstancesAccessorsForClass: aClass]]]