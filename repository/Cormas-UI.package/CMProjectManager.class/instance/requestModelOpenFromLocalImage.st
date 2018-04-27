callbacks
requestModelOpenFromLocalImage
	" Open a Cormas model. Answer project creation status, <true> if project was opened successfully "

	| mName fileName |		
	(mName := self requestModelOpenDialogFromLocalImage)
		ifNotNil: [ : modelName | openStatus := true ].
	openStatus
		ifTrue: [ 
			self openImageProject: mName.
			self doPostOpenActions ]
		ifFalse: [ self informMessage: self translator tProjectOpenFailed ].
	^ openStatus
		