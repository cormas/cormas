+ accessing
elementaryComponents
	"Purpose: returns the elementary components. 
Use to collect the components of components when the receiver is an aggregate of aggregates"
	
	| allComponents |
	^((self at: 1) class inheritsFrom: SpatialEntityElement)
		ifTrue: [self components]
		ifFalse:
			[allComponents := OrderedCollection new.	"recursif method"
			self components do: [:c | allComponents addAll: c elementaryComponents].
			^allComponents]