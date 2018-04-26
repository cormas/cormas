name
setName: aString
	"Change the name of the sheet"
	
	self name: aString.
	^sheet setProperty: 'Name' value: aString