Extension { #name : #Point }

{ #category : #'*Cormas-Core' }
Point >> scaledBy: amount [ 
	"Answer a new object scaled by the argument amount, which can be
	a Point or a scalar value."
	
	^ self * amount
]
