actions
getSelectedEntities
	
	| arg isTesting |
	isTesting := self entityClass methodsForTestingNoArg
		includes: testElement value asSymbol.
	((((testValue value = true or: [testValue value = false])
		or: [testValue value isSymbol]) or: [testValue value isString])
		and: [operator value ~= '=']) ifTrue: [isTesting ifFalse: [^nil]].
	(operator value asSymbol = #' ' and: [isTesting not]) ifTrue: [^nil].
	(testElement value includes: $:)
		ifFalse:
			[^self entitiesCollection
				select:
					[:e | 
					isTesting
						ifTrue: [e perform: testElement value asSymbol]
						ifFalse:
							[(e perform: testElement value asSymbol)
								perform: operator value asSymbol
								with: testValue value	"Cormas valueOfValueInString:"]]]
		ifTrue:
			[arg := Cormas
				askUserArgumentsForMethod: testElement value
				classesAsArgForModel: self cormasModel.
			arg ifNil: [^nil].
			^self entitiesCollection
				select:
					[:e | 
					(e
						perform: testElement value asSymbol
						withArguments: arg)
						perform: operator value asSymbol
						with: testValue value	"Cormas valueOfValueInString:"]]