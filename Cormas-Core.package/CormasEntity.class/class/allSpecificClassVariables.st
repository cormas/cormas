- accessing - methods & classes
allSpecificClassVariables
	"Purpose: returns the list of classVars of this class and its SuperClass that are not from the Kernel (ie. classes that are not genericEntities)
Return value: an orderedCollection
Example: GroupLocation allSpecificClassVariables"
	
	| superClasses |
	superClasses := self withAllSuperclasses copy.
	superClasses remove: Object.
	superClasses removeAllSuchThat: [:cl | self genericEntities includes: cl].
	superClasses isEmpty ifTrue: [^#()].
	^self allClassVariablesUntil: superClasses last