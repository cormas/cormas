display
displayAllPovs
	"Called when a new instance of SpaceInterface is opened from a parent interface"
	
	| aClass |
	self displayGrid.	"self displayAllOccupants."
	self povMethodDico
		keysAndValuesDo:
			[:aKeyClass :selectorName | 
			aClass := aKeyClass class.
			(aClass isAbstract or: [selectorName = #nil])
				ifFalse: [self drawing changePov: selectorName ofEntity: aClass]]