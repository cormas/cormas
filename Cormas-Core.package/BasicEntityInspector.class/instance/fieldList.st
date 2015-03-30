field list
fieldList
	
	| collec |
	self attributesSpec ifNotNil: [^self fieldList_SIconfig].
	collec := SortedCollection new.
	self objectClassAndItsUserDefinedSuperClasses
		do: [:c | collec addAll: c instVarNames].
	collec := collec asOrderedCollection.
	collec addFirst: '----------'.
	(((object class superClassesUntil: CormasEntity) includes: AgentComm)
		or:
			[(object class superClassesUntil: CormasEntity) includes: AgentCommLocation])
		ifTrue: [collec addFirst: 'mailBox'].
	(object class inheritsFrom: SpatialEntityCell)
		ifTrue: [collec addFirst: 'state'].
	(object class isSpatialClass and: [object isElementary not])
		ifTrue: [collec addFirst: 'destroyed'].
	object class isSpatialClass ifFalse: [collec addFirst: 'dead'].
	collec addFirst: 'id'.
	^collec