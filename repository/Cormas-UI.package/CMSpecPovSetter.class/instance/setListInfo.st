initialization
setListInfo

	| liste tmp |
	liste := OrderedCollection new.
	liste addAll: (self inheritedMethodsFrom: selectedClass category: #'star info').
	liste addFirst: '----'.
	tmp := (selectedClass organization listAtCategoryNamed: #'star info') asOrderedCollection.
	tmp addAll: (selectedClass organization listAtCategoryNamed: #info). 
	"to ensure compatibility for models implemented with previous Cormas versions" 
	1 to: tmp size do: [ : i | self formatItemAt: i from: tmp ].
	liste addAllFirst: tmp.
	self listInfo items: liste.
	liste isEmpty 
		ifFalse: [ self listInfo selectFirstItem ].