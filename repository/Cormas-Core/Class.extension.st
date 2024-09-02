Extension { #name : 'Class' }

{ #category : '*Cormas-Core' }
Class >> concreteSubclasses [

	^ self allSubclasses select: [ : cls | cls subclasses isEmpty ]

]
