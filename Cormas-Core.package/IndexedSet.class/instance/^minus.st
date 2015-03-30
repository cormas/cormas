removing
- aSet
	"Answer those elements present in the receiver and absent from aSet."
	
	^self reject: [:i | aSet includes: i]