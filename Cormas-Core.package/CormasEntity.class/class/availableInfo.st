as yet unclassified
availableInfo
"Purpose: returns the list of available info methods
Return value: <IndexedSet>"
	
	| collec |
	collec := IndexedSet new.
			self withAllSuperclasses
				do:
					[:cl | 
					collec
						addAll: (cl organization listAtCategoryNamed: '* info' asSymbol);
						addAll: (cl organization listAtCategoryNamed: #info)].
			collec addFirst: #nil.
	^collec