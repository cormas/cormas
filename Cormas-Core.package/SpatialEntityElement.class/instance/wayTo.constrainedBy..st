- deprecated
wayTo: anotherCell constrainedBy: aCondition
	"DEPRECATED. Should use #wayTo: anotherCell constraint: aCondition
Return an OrderedCollection of cells describing the shortest way to anotherCell according to the constraint aBlock.
path := self wayTo: anotherCell constraint: [:aCell | aCell landCover ~= #ditch].
See example in 'DemoWayTo' model"
	
	^self wayTo: anotherCell constraint: aCondition