actions
selectImLib: text
	
	self observer
		setNewVectorialImage:
			(self class
				perform:
					('vectorLib'
						,
							(text
								copyFrom: 12
								to: text size)) asSymbol).
	self closeAndUnschedule