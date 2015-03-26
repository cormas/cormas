+ activityEditor
openActivityDiagram: operationName
	" Agent openActivityDiagram: #exampleTest   "
	
	| ad |
	"le diagramme en m√©moire s'ouvre mais les activit√©s ne sont plus connect√©es. Il faut donc recr√©er"
	self activityDiagrams
		removeKey: operationName
		ifAbsent: [nil].
	ad := self activityDiagramsAt: operationName.
	ad open.
	ad setTitle.
	^ad