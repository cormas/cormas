field list
fieldList_SIconfig
	
	| collec |
	collec := SortedCollection new.
	collec
		addAll:
			((self attributesSpec at: object class) collect: [:att | att asString]).
	^collec