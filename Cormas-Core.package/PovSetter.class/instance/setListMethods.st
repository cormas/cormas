initialize-release
setListMethods
	
	| liste tmp |
	liste := List new.
	liste
		addAll: (self inheritedMethodsFrom: selectedClass category: #'* pov').
	liste addFirst: '----'.
	tmp := (selectedClass organization listAtCategoryNamed: #'* pov')
		asOrderedCollection.
	tmp addAll: (selectedClass organization listAtCategoryNamed: #pov).	"to ensure compatibility for models implemented with previous Cormas versions"
	1
		to: tmp size
		do:
			[:i | 
			tmp
				at: i
				put: (tmp at: i) asString , ' (' , selectedClass name asString , ')'].
	liste addAllFirst: tmp.
	self listMethods list: liste.
	liste isEmpty ifFalse: [listMethods selection: listMethods list first].
	listMethods selectionIndexHolder onChangeSend: #listMethodsChanged to:
			self