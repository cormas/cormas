Extension { #name : 'GPoint' }

{ #category : '*Cormas-Core' }
GPoint >> * arg [ 
	"Answer a Point that is the product of the receiver and arg."
	"((2@2) * (100@200)) >>> (200@400)"
	"((2@2) * 200) >>> (400@400)"
	
	arg isPoint ifTrue: [^ (self x * arg x) @ (self y * arg y)].
	^ arg adaptToPoint: self andSend: #*
]
