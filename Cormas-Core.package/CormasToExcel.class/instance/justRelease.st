releasing
justRelease
	"Do not quit the application, but release the receiver's resources"
	
	workbook release	"controller notNil
		ifTrue: 
			[controller release.
			controller := nil]"