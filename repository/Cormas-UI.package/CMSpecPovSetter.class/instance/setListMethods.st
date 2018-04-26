initialization
setListMethods
	| liste tmp |
	liste := OrderedCollection new.
	liste addAll: (self inheritedMethodsFrom: selectedClass category: #'star pov').
	liste addFirst: '----'.
	tmp := (selectedClass organization listAtCategoryNamed: #'star pov') asOrderedCollection.
	tmp addAll: (selectedClass organization listAtCategoryNamed: #pov).
	"to ensure compatibility for models implemented with previous Cormas versions"
	1 to: tmp size do: [ :i | tmp at: i put: (self formatItemAt: i from: tmp) ].
	liste addAllFirst: tmp.
	self listMethods items: liste.
	liste isEmpty
		ifFalse: [ self listMethods selectFirstItem ]