instance creation
new
	
	| browser |
	browser := super new.
	PDPManager notifyOnMethodChanged: browser.
	^browser	"Smalltalk Professional Debug Package Version 2.6 (c) 2001 Crafted Smalltalk"