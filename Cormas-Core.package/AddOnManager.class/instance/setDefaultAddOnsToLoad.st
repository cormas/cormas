default add-ons
setDefaultAddOnsToLoad
	
	| collec |
	collec := self readDefaultAddOnsToLoad.
	collec isEmpty
		ifFalse:
			[self addOns_List list
				do:
					[:i | (collec includes: i fileAsString) ifTrue: [i shouldLoad: true]]]