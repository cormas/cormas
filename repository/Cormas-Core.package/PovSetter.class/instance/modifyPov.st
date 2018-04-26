action
modifyPov
	
	| aSelector aClass |
	selectedClass = nil ifTrue: [^nil].
	(self listMethods selection isNil
		or: [self listMethods selection = '----']) ifTrue: [^nil].
	aSelector := (self removeBrackets: self listMethods selection) asSymbol.
	aClass := selectedClass whichClassIncludesSelector: aSelector.
	self editMethod: aSelector fromClass: aClass