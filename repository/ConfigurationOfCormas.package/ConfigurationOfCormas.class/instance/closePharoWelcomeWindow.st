doits
closePharoWelcomeWindow
	" Pharo 6.x version "

	World submorphs
		select: [ : sm | 
			sm isSystemWindow 
				and: [ sm label = PharoWelcomePage title
					or: [ sm label endsWith: 'Welcome' ] ] ]
		thenDo: [ : window | window delete ].