- printing - documentation
recordProtocol: cat class: aClass
	
	| dict |
	dict := Dictionary new.
	(Kernel includes: aClass)
		ifTrue: [(cat first = $+ or: [cat first = $*]) ifFalse: [^dict]]
		ifFalse:
			[(cat = #description or: [cat first = $- or: [cat = #'pov symbols']])
				ifTrue: [^dict]].
	(aClass organization listAtCategoryNamed: cat)
		do:
			[:sel | dict add: (self recordMethod: sel category: cat class: aClass)].
	^dict