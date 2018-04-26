aspects
betweenLabels
	
	self nbPts <= 10 ifTrue: [^1].
	self nbPts <= 50 ifTrue: [^5].
	self nbPts <= 100 ifTrue: [^10].
	self nbPts <= 500 ifTrue: [^25].
	^50