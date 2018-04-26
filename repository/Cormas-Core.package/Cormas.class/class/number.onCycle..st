+ utilities - mathematics
number: aNumber onCycle: aCycleBase
	"Purpose : return a new number from aNumber transformed in aCycleBase. 
If aNumber exceeds aCycleBase, return to 1
Arguments: aNumber = <Integer>
aCycleBase = <Integer>.
Examples: 
	Cormas number: 4 onCycle: 5 => 4
	Cormas number: 5 onCycle: 5 => 5
	Cormas number: 6 onCycle: 5 => 1
	Cormas number: 7 onCycle: 5 => 2"
	
	^(aNumber - 1) \\ aCycleBase + 1