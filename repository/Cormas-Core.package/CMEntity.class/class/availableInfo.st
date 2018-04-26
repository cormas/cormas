- accessing - methods & classes
availableInfo
	"Purpose: returns the list of available info methods
Return value: <OrderedCollection>"
	
	| collec |
	collec := OrderedCollection new.
	self withAllSuperclasses
		do:
			[:cl | 
			collec
				addAll: (cl organization listAtCategoryNamed: '* info' asSymbol);
				addAll: (cl organization listAtCategoryNamed: #info)].
	collec addFirst: #nil.
	^collec