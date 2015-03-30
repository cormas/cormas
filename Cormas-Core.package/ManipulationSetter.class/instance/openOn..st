initialize-release
openOn: aModel
	
	| win |
	cormasModel := aModel.
	self prepareTable.
	win := (self allButOpenInterface: #windowSpec) window.
	win open.
	entity value: entityChoices value first