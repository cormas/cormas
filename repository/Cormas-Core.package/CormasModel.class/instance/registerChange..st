private - notification
registerChange: aChange
	"register a Change (transmit the change immediatly or in a group later"
	
	delayedChanges == nil
		ifTrue:
			["immediate transmission"
			self spaceModel noticeChange: aChange]
		ifFalse:
			["store the change information for delayed transmission"
			"In case the delaychanges already includes an #updateEntity notice on that same entity ->"
			"aChange symbol = #valueChanged ifTrue:[coll removeAllSuchThat: [:c| c symbol  = #valueChanged and:[c entity = aChange entity]]]."
			delayedChanges size >= 200
				ifTrue:
					[| coll |
					coll := delayedChanges.
					delayedChanges := OrderedCollection new: 200.
					self spaceModel noticeChanges: coll].
			delayedChanges add: aChange]