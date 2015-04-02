accessing
passiveEntitiesClassNames
	
	| collec |
	collec := IndexedSet new.
	collec
		add: 'Msg';
		add: 'PassiveObject'.
	self environment allClasses
		do:
			[:aClass | 
			(aClass inheritsFrom: PassiveObject)
				ifTrue: [collec add: aClass name asString]].
	^collec