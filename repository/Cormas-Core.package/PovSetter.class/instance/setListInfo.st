initialize-release
setListInfo
	
	| liste tmp |
	liste := List new.
	liste
		addAll: (self inheritedMethodsFrom: selectedClass category: #'* info').
	liste addFirst: '----'.
	tmp := (selectedClass organization listAtCategoryNamed: #'* info')
		asOrderedCollection.
	tmp addAll: (selectedClass organization listAtCategoryNamed: #info).	"to ensure compatibility for models implemented with previous Cormas versions"
	1
		to: tmp size
		do:
			[:i | 
			tmp
				at: i
				put: (tmp at: i) asString , ' (' , selectedClass name asString , ')'].
	liste addAllFirst: tmp.
	self listInfo list: liste.
	liste isEmpty ifFalse: [listInfo selection: listInfo list first]	"listMethods selectionIndexHolder onChangeSend: #listMethodsChanged to: self."