actions
setAttributeValue
	"set the new value on attributeToChange for all or subset of entities"
	
	| collec |
	(self entityClass isNil not
		and:
			[self attributeToChange value isNil not
				and: [self valueForAttribute value isNil not]]) ifFalse: [^nil].
	self selectedEntities isEmpty
		ifTrue: [collec := self entitiesCollection]
		ifFalse: [collec := self selectedEntities].	"storing for Undo"
	self linkedSpaceInterface isNil
		ifFalse: [self linkedSpaceInterface storeBeforeManipulation].	"performing new value"
	collec
		do:
			[:e | 
			e
				perform: (attributeToChange value , ':') asSymbol
				with: valueForAttribute value]