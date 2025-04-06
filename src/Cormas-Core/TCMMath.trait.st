Trait {
	#name : #TCMMath,
	#category : 'Cormas-Core-Traits'
}

{ #category : #'utilities - mathematics' }
TCMMath >> logisticGrowth: x r: r k: k [
	"Purpose: Returns the next value of X(t+1), according to the discrete logistic equation :
	 X(t+1) = X(t) + dx /dt  "

	^ x + (self logisticIncrease: x r: r k: k)
]

{ #category : #'as yet unclassified' }
TCMMath >> logisticGrowthContinuous: x r: r k: k [
	"Returns the next value of X(t+1), according to the continuous logistic equation :
	 f(x,t) = x(t) = K / [(K-Xo)/Xo . exp(- r.t) + 1]   "

	^ k / (k - x / x * r negated exp + 1)
]

{ #category : #'as yet unclassified' }
TCMMath >> logisticIncrease: x r: r k: k [
	"Returns the increase of X (dx /dt), according to the discrete logistic equation :
	 dx / dt  = r . x . (K - X(t)) / K "

	^ r * x * (k - x) / k
]
