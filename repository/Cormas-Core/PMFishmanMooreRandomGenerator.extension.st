Extension { #name : #PMFishmanMooreRandomGenerator }

{ #category : #'*Cormas-Core' }
PMFishmanMooreRandomGenerator >> nextInteger: anInteger [
	" For compatibility with Pharo 9 "

	^ (self next * anInteger) truncated + 1
]
