initialize-release
addCAV: aCAV
	"Add aCAV from the list of ClassAttributeValues"
	
	| aList |
	aList := self classAttribValue_List list.
	(aList includes: aCAV) ifFalse: [aList add: aCAV].
	self classAttribValue_List list: aList.
	^aCAV