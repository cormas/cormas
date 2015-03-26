managing classes
occupantClasses
	"return a collection of classes for which intances are located on the grid"
	
	^self allClasses select: [:cl | cl isSituatedClass]