+ instance creation
newEntity: aClass
	"Purpose: creates a new instance of aClass. This new instance will be collected at the level of the model (theXXXs collection) at the end of the current timestep
Return value: an instance of aClass
Example: newBorn := self newEntity: self class"
	
	| anEntity |
	anEntity := aClass new.
	anEntity collector: self collector.
	self collect: anEntity.
	^anEntity