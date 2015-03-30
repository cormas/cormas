actions
selectEntities
	
	| collec |
	self entityClass ifNil: [^nil].
	(self entityClass findSelector: testElement value asSymbol) ifNil: [^nil].
	((testElement value asSymbol includes: $:) and: [testValue value isNil])
		ifTrue: [^nil].
	(testValue value isNil
		and:
			[(self entityClass methodsForTestingNoArg
				includes: testElement value asSymbol) not]) ifTrue: [^nil].	"(((testValue value isNil not) and:[(self entityClass findSelector: testElement value asSymbol) isNil not]) and:[operator value ~= '']) ifTrue:["
	collec := self getSelectedEntities.
	collec
		ifNil: [^nil]
		ifNotNil: [self selectedEntities: collec].
	self nbEntitiesSelected value: self selectedEntities size.
	self isSituatedEntity
		ifTrue:
			[self nbEntitiesSelectedSituated
				value: (self selectedEntities select: [:a | a isSituated]) size].
	self linkedSpaceInterface
		ifNotNil: [self updateFiguresSelectedOnSpaceInterface]