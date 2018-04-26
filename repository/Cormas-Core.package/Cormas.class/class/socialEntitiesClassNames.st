accessing
socialEntitiesClassNames
	
	| collec |
	collec := OrderedCollection new.
	collec add: 'Agent'.
	self cmEnvironment allClasses "should be allEntityClasses ??" 
		do: [ : aClass | (aClass inheritsFrom: CMAgent) 
				ifTrue: [ collec add: aClass name asString ] ].
	^ collec