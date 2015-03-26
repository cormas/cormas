initialize-release
addCAVfromClass: aKlass attribute: anAttribute value: aValue
	"Add aCAV from the list of ClassAttributeValues"
	
	| aList aCAV |
	aList := self classAttribValue_List list.
	aList
		add:
			(aCAV := ClassAttributeValue newClass: aKlass attribute: anAttribute value:
					aValue).
	self classAttribValue_List list: aList.
	^aCAV