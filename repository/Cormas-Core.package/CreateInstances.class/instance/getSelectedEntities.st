actions
getSelectedEntities
	
	((((testValue value = true or: [testValue value = false])
		or: [testValue value isSymbol]) or: [testValue value isString])
		or:
			[self entityClass methodsForTesting includes: testElement value asSymbol])
		ifTrue: [operator value ~= '=' ifTrue: [^nil]].
	^self entitiesCollection
		select:
			[:e | 
			(e perform: testElement value asSymbol)
				perform: operator value asSymbol
				with: testValue value	"Cormas valueOfValueInString: "]