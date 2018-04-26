- accessing - methods & classes
superClassesInSameEnvironmentUntilEntity
	"Purpose: returns the list of super classes of the receiver that share the same environment up to Entity
Return value: an orderedCollection
Example: FarmerTypeA superClassesInSameEnvironmentUntil: Entity"
	
	^self superClassesInSameEnvironmentUntil: CMEntity