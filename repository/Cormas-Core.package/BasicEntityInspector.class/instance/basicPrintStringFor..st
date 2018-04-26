initialize-release
basicPrintStringFor: anObject
	"Answer a the name of the entity instance"
	
	^anObject class name asString , ' n¬∞ ' , anObject id printString