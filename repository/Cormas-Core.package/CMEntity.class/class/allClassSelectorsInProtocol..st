- accessing - methods & classes
allClassSelectorsInProtocol: aProtocolName
	"Purpose: returns the list of all methods defined at class level in a given protocol
Return value: an indexedSet
Example: CormasNS.Kernel.Entity allClassSelectorsInProtocol: #'+ util_Color'  "
	
	| coll |
	coll := OrderedCollection new.
	(self superClassesUntil: Object)
		do:
			[:aClass | coll addAll: (aClass class organization listAtCategoryNamed: aProtocolName)].
	^coll