aspects
entityIdField
	
	^entityIdField isNil
		ifTrue: [entityIdField := 0 asValue]
		ifFalse: [entityIdField]