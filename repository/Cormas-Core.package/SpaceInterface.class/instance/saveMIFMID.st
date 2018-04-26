menu - actions
saveMIFMID
	
	| workingWindow c l |
	l := self spaceModel spatialEntities keys asArray.
	c := Dialog
		choose: 'Which class?'
		fromList: l
		values: l
		lines: 8
		cancel: [#noChoice]
		for: Dialog defaultParentWindow.
	c = #noChoice ifTrue: [^nil].
	workingWindow := MenuSpaceInterfaces new
		initSaveMIFMID:
			(self cormasModelClass spatialClasses detect: [:cn | cn name asSymbol = c]).
	workingWindow openDialog: #windowSaveMIFMID with: self