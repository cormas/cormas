action
modifyInfo
	
	| aSelector aClass |
	selectedClass = nil ifTrue: [^nil].
	(self listInfo selection isNil or: [self listInfo selection = '----'])
		ifTrue: [^nil].
	aSelector := (self removeBrackets: self listInfo selection) asSymbol.
	aClass := selectedClass whichClassIncludesSelector: aSelector.
	self editMethod: aSelector fromClass: aClass