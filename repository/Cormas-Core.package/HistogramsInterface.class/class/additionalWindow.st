initialize-release
additionalWindow
	
	| a aModel |
	aModel := HistogramsInterface allInstances last cormasModel.
	a := self new.
	a cormasModel: aModel.
	a init.
	a open