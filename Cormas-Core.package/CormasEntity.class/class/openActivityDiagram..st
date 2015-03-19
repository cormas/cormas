as yet unclassified
openActivityDiagram: operationName

	| ad |
	
	ad := self getActivityDiagram: operationName.
	ad open.
	ad setTitle.
	
	^ad