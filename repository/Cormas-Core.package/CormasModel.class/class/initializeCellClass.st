instance creation
initializeCellClass
"Store the Cell class of the model into #cellClass"
	self cellClass: (self allEntityClasses
		detect: [ :cl | cl inheritsFrom: CMSpatialEntityElement ]
		ifNone: [ nil ]).
