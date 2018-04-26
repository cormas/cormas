interface opening
open
	
	self dependents isEmpty
		ifTrue:
			[builder := self allButOpenInterface: #windowSpec.
			builder window
				label:
					builder window label , self spaceInterface basicTitle printString.
			self initDisplayOptionsMenu.
			self setCheckMarksForDisplayOptionsMenu.
			^builder window open]
		ifFalse: [self mainWindow raise]