testing
checkBrowserNotEditing
	
	| b |
	b := self browser.
	(b toolsets allSatisfy: [:each | each isEditing not])
		ifFalse:
			[^b
				confirm:
					#ModifiedViewsExistsExitAnyway << #browser >>
							'Modified views exists.
Exit anyway?']
		ifTrue: [^true]