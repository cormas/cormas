Extension { #name : 'PMPseudoRandomNumberGenerator' }

{ #category : '*Cormas-Core' }
PMPseudoRandomNumberGenerator >> nextInteger: anInteger [
	"For compatibility with Pharo collection methods such as #shuffledBy: and #atRandom: used by Cormas"

	^ (self next * anInteger) truncated + 1
]
