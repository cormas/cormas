main menu
openModelGlossary
	"open a glossary containing a list of the methods (and their comments) of the model"
	
	| allClasses |
	self cormasModelClass isNil ifTrue: [^self warn: 'Please, load a model'].
	allClasses := OrderedCollection new.
	allClasses add: self cormasModelClass.
	allClasses addAll: self cormasModelClass allClasses.
	^self openCormasGlossaryClasses: allClasses