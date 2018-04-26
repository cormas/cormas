model saving&loading
prepareSavingAs: extensionFile
	"Prepare the exportation of the model as ST file or Parcel, according to extensionFile. The user can choose the file name and also the version of the model as a consequence.
Return a filename or nil.
extensionFile = <String>  ex: '.st' or '.pcl' "
	
	| fileName defaultFileName |
	(self cormasModelClass version = 'v-0'
		or: [self cormasModelClass version isNil])
		ifTrue:
			[defaultFileName := (self class modelPath: self cormasModelClass name)
				construct: self cormasModelClass name asString , extensionFile]
		ifFalse:
			[defaultFileName := (self class modelPath: self cormasModelClass name)
				construct: self cormasModelClass version.
			defaultFileName := ((Cormas removeExtensionOf: defaultFileName) asString
				, extensionFile) asFilename].
	fileName := Dialog
		requestNewFileName:
			(UserMessage defaultString: 'Save as' key: #saveas) asString
		default: defaultFileName.
	fileName = '' ifTrue: [^nil].
	self setModelVersionEqualTo: fileName asFilename.
	self cormasModelClass
		setDescriptionFor: 'lastUpdate'
		withText: Date today printString.
	self cormasModelClass updateComments.
	self updateGUI.
	^fileName asFilename