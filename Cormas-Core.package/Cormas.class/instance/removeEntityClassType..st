model entities
removeEntityClassType: aType
	"aType is either 'Spatial', 'Social' or 'Passive'"
	
	| classToBeRemoved selectionInList selector answer |
	selectionInList := self perform: ('list' , aType , 'Entities') asSymbol.
	classToBeRemoved := self getSelectedEntityClassType: aType.
	selector := ((Cormas lowerCaseString: aType) , 'Classes') asSymbol.
	classToBeRemoved isNil ifTrue: [^nil].
	answer := classToBeRemoved withAllSubclasses size > 1
		ifFalse:
			[self confirm: 'Delete the class ' , classToBeRemoved name asString , ' ?']
		ifTrue:
			[| sousClasses |
			sousClasses := ''.
			classToBeRemoved allSubclasses
				do: [:cl | sousClasses := sousClasses , '   ' , cl name asString , '\'].
			self
				confirm:
					('Delete the class ' , classToBeRemoved name asString ,
							' and the following subclasses ? \' , sousClasses) withCRs].
	answer ifFalse: [^nil].
	((OrderedCollection with: classToBeRemoved)
		addAll: classToBeRemoved allSubclasses;
		yourself)
		do:
			[:cl | 
			(self cormasModelClass perform: selector) remove: cl.
			self removeModelAccessors: cl name asString].
	classToBeRemoved = self cormasModelClass cellClass
		ifTrue: [self cormasModelClass cellClass: nil].
	classToBeRemoved removeFromSystem.
	selectionInList list: (self getSortedListEntityClassType: aType).
	selectionInList selectionIndex: 0