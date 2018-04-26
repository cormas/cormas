actions
install
	
	(Dialog confirm:
			'You are about to change the image. The relative size will be set to 100% and the position on the cell will be at center.
Do you want to continue?') ifFalse: [^nil].
	self targetClass: self observer class.
	super install isNil ifFalse: [self observer setNewBitMapImage]