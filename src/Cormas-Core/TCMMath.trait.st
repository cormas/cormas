Trait {
	#name : 'TCMMath',
	#category : 'Cormas-Core-Traits',
	#package : 'Cormas-Core',
	#tag : 'Traits'
}

{ #category : 'utilities - mathematics' }
TCMMath classSide >> number: aDecimalNumber onCycle: aCycleBase [
	"Purpose : return a new number from aNumber transformed into aCycleBase. 
If aDecimalNumber exceeds aCycleBase, return to 1
Arguments: aDecimalNumber = <Integer>
aCycleBase = <Integer>.
Examples: 
(-5 to: 19) collect: [:i | Cormas number: i onCycle: 10]  => #(5 6 7 8 9 10 1 2 3 4 5 6 7 8 9 10 1 2 3 4 5 6 7 8 9)
	TCMMath number: 4 onCycle: 5 => 4
	TCMMath number: 5 onCycle: 5 => 5
	TCMMath number: 6 onCycle: 5 => 1
	TCMMath number: 7 onCycle: 5 => 2
	TCMMath number: 365 onCycle: 365 => 365
	TCMMath number: 366 onCycle: 365 => 1"

	^ aDecimalNumber - 1 \\ aCycleBase + 1
]

{ #category : 'utilities - mathematics' }
TCMMath >> logisticGrowth: x r: r k: k [
	"Purpose: Returns the next value of X(t+1), according to the discrete logistic equation :
	 X(t+1) = X(t) + dx /dt  "

	^ x + (self logisticIncrease: x r: r k: k)
]

{ #category : 'utilities - mathematics' }
TCMMath >> logisticGrowthContinuous: x r: r k: k [
	"Returns the next value of X(t+1), according to the continuous logistic equation :
	 f(x,t) = x(t) = K / [(K-Xo)/Xo . exp(- r.t) + 1]   "

	^ k / (k - x / x * r negated exp + 1)
]

{ #category : 'utilities - mathematics' }
TCMMath >> logisticIncrease: x r: r k: k [
	"Returns the increase of X (dx /dt), according to the discrete logistic equation :
	 dx / dt  = r . x . (K - X(t)) / K "

	^ r * x * (k - x) / k
]

{ #category : 'utilities - mathematics' }
TCMMath >> number: aDecimalNumber onCycle: aCycleBase [
	"Purpose : return a new number from aNumber transformed into aCycleBase. 
If aDecimalNumber exceeds aCycleBase, return to 1
Arguments: aDecimalNumber = <Integer>
aCycleBase = <Integer>.
Examples: 
(-5 to: 19) collect: [:i | Cormas number: i onCycle: 10]  => #(5 6 7 8 9 10 1 2 3 4 5 6 7 8 9 10 1 2 3 4 5 6 7 8 9)
	self number: 4 onCycle: 5 => 4
	self number: 5 onCycle: 5 => 5
	self number: 6 onCycle: 5 => 1
	self number: 7 onCycle: 5 => 2
	self number: 365 onCycle: 365 => 365
	self number: 366 onCycle: 365 => 1"

	^ self class number: aDecimalNumber onCycle: aCycleBase
]
