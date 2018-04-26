charts
getSimInfo
	"Get the cell matrix from Excel into Smalltalk."
	
	| range info |
	range := self sheet getRange: 'A1'.
	[info := range value copy] ensure: [range release].
	^info