displaying
displayOn: aGraphicsContext
	
	super displayOn: aGraphicsContext.
	annotations do: [:each | each displayOn: aGraphicsContext].
	info isNil ifFalse: [self displayInfoOn: aGraphicsContext]