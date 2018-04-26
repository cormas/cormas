main menu
updateCormas
	"Update the Cormas version by loading cormas.pcl situated into vw/cormas/ directory"
	
	| parcelName previousModel newCormas result |
	"Update Cormas using the Parcel stored in VW/Cormas/"
	previousModel := self cormasModelClass.
	parcelName := Dialog
		requestFileName: 'Update Cormas using the Parcel...' asString
		default:
			(SourceFileManager default targetFile logicalName directory construct:
					'cormas.pcl') asFilename.
	parcelName = '' ifTrue: [^nil].
	self closeAllWindows.
	self uiSession close.
	self builder window close.
	self builder window controller closeAndUnschedule.
	VisualLauncher raiseSingleInstance.
	result := Parcel loadParcelFrom: parcelName.
	self mainWin isNil
		ifFalse:
			[self cormasModel isNil
				ifFalse:
					[self closeModel.
					self mainWin close]].
	newCormas := Cormas open model.
	result isNil ifFalse: [Cormas saveImage].
	newCormas openModel: previousModel	"visualLauncher updateCormas"