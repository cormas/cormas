releasing
release
	"Make the application quit and release the receiver's resources"
	
	controller notNil
		ifTrue:
			[controller
				quit;
				release.
			controller := nil]