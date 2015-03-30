private-attButons
attButton17
	
	| index |
	index := (thisContext selector
		copyFrom: 10
		to: thisContext selector size) asNumber.
	self performButtonFor: (self attribute_List list at: index)