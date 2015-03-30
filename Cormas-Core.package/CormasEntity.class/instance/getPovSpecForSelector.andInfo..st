- displaying
getPovSpecForSelector: selectorName andInfo: aInfoName
	"Returns the Pov Spec for a pov selectorName and a infoName "
	
	| spec |
	spec := EntityPOVSpec new.
	spec povSelector: selectorName.
	spec povResult: (self getPovResultFor: selectorName).
	spec infoName: aInfoName.
	spec infoResult: (self getInfoFor: aInfoName).
	^spec