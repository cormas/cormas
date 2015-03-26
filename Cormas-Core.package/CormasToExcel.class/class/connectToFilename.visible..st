new
connectToFilename: aFilename visible: aBoolean
	"Load COM-All to connect to Excel"
	
	| inst |
	Screen default platformName = 'MS-Windows'
		ifTrue: [Parcel ensureLoadedParcel: 'Com- All' withVersion: '7.1']
		ifFalse:
			["To fix"
			self subclassResponsibility].
	inst := self new.
	inst linePos: 1.
	inst fileName: aFilename asString.
	inst launchApplicationVisible: aBoolean.
	^inst