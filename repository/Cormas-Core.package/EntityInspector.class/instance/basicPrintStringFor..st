upper class surdefinition
basicPrintStringFor: anObject
	"Answer a the name of the entity instance"
	
	^self entityClass name asString , ' n¬∞ ' , self entityId printString