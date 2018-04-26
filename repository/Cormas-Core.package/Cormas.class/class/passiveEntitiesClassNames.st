accessing
passiveEntitiesClassNames
	
	| collec |
	collec := OrderedCollection new.
	collec
		add: 'Msg';
		add: 'PassiveObject'.
	self cmEnvironment allClasses "should be allEntityClasses ??" 
		do: [ : aClass | (aClass inheritsFrom: PassiveObject)
			ifTrue: [collec add: aClass name asString ] ].
	^ collec