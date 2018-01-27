settings
setParcelPathForModel: aModelAsString
	"Add Parcel path"
	
	| aPath |
	aPath := Cormas modelPath: aModelAsString.
	self setParcelPath: aPath