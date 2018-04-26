+ instance creation
newAndCollect: aClass
	"Purpose: creates a new instance of aClass and IMMEDIATELY collects it at the level of the model (theXXXs collection)
Return value: an instance of aClass
Example: newBorn := self newAndCollect: self class"
	
	| anEntity |
	anEntity := self newEntity: aClass.
	anEntity collector updateEntities.
	^anEntity