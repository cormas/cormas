actions
launchPackaging
	"launch all conditions"
	
	self userHasChoosedTargetFile ifFalse: [self updateTargetFileVM].
	self checkConditions ifFalse: [^self].
	(Dialog
		confirm:
			'This is the last step before packaging the image.\The image will be closed at the end of the process.\Do you really want to package now ?'
				withCRs) ifFalse: [^self].
	self doPackaging