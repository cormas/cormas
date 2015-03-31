+ components - managing
deleteComponents: aCollec
	"Purpose: removes a given set of components and tests if some components have effectively been removed before computing the surround again
Argument: aCollec = <Collection(SpatialEntity)>
Example: self removeComponents: self getEpidermis"
	
	| initialSize |
	initialSize := self components size.	"aCollec do: [:c | self components remove: c ifAbsent: []]."	"NB 2014-04-11->previous line replaced by the following because some elements are not removed with the previous method"
	self components: self components - aCollec.
	aCollec
		do:
			[:c | 
			c compoundSpatialClasses
				at: self class name
				put: nil].
	initialSize ~= self components size ifTrue: [self setSurround]