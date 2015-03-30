+ control
stepDynPop
	"Purpose: activate the biological life cycle of each agent of the group. 
Nota: the 'step' method of the Agent must return a collection either empty if there is no successuful reproduction or made of newborn instances to be added as new components of the group"
	
	| newBorns repro firstComp |
	(self components notNil and: [self components isEmpty not])
		ifTrue:
			[firstComp := self components first.
			(firstComp cormasHelper isTypeEntity and: [firstComp isAgent])
				ifTrue:
					[newBorns := OrderedCollection new.
					(Cormas mixt: self components)
						do:
							[:anAgent | 
							repro := anAgent step.
							newBorns addAll: repro].
					self updateWith: newBorns]].
	^newBorns