paths
addOnsPath
	"Returns a Filename corresponding to the path of 'Add-ons' directory"
	
	| path |
	path := self cormasPath construct: 'Add-ons'.
	path asFilename exists ifFalse: [path asFilename makeDirectory].
	^path