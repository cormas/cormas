callbacks
requestModelOpenFromLocalDisk
	" Open a Cormas model. Answer project creation status, <true> if project was opened successfully "

	| mName fileName |		
	(mName := self requestModelOpenDialogFromLocalImage)
		ifNotNil: [ : modelName | fileName := self openModelNamed: modelName ].
	openStatus
		ifTrue: [ 
			self openProject: mName fileName: fileName.
			self doPostOpenActions ]
		ifFalse: [ self informMessage: self translator tProjectOpenFailed ].
	^ openStatus
		