aspects
toStep
	
	toStep isNil ifTrue: [^toStep := cormasModel timeStep asValue].
	toStep value > (self nbPts - 1) ifTrue: [^toStep value: self nbPts - 1].
	^toStep