field list
fieldList
	
	| collec |
	self attributesSpec ifNotNil: [^self fieldList_SIconfig].
	collec := SortedCollection new.
	self objectClassAndItsUserDefinedSuperClasses
		do: [:c | collec addAll: c instVarNames].
	collec := collec asOrderedCollection.
	collec addFirst: '----------'.
	(((object class superClassesUntil: CMEntity) includes: CMAgentComm)
		or: [ (object class superClassesUntil: CMEntity) includes: CMAgentCommLocation ])
			ifTrue: [collec addFirst: 'mailBox'].
	(object class inheritsFrom: CMSpatialEntityCell)
		ifTrue: [collec addFirst: 'state'].
	(object class isSpatialClass and: [object isElementary not])
		ifTrue: [collec addFirst: 'destroyed'].
	object class isSpatialClass ifFalse: [collec addFirst: 'dead'].
	collec addFirst: 'id'.
	^collec