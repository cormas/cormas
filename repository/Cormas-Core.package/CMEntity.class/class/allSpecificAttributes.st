- accessing - methods & classes
allSpecificAttributes
	"Purpose: returns the list of attributes of this class and its SuperClass that are not from the Kernel (ie. classes that are not genericEntities)
Return value: an orderedCollection
Example: GroupLocation allSpecificAttributes"
	
	| superClasses |
	superClasses := self withAllSuperclasses copy.
	superClasses remove: Object.
	superClasses removeAllSuchThat: [:cl | self genericEntities includes: cl].
	superClasses isEmpty ifTrue: [^#()].
	^self allAttributesUntil: superClasses last