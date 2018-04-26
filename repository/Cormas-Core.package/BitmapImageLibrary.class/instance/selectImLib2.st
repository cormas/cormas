actions
selectImLib2
	
	| text |
	text := thisContext selector.
	self observer
		setNewBitmapImage:
			(self class
				perform:
					('imLib'
						,
							(thisContext selector
								copyFrom: 12
								to: thisContext selector size)) asSymbol).
	self closeAndUnschedule.
	^self