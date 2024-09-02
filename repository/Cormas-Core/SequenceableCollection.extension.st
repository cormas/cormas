Extension { #name : 'SequenceableCollection' }

{ #category : '*Cormas-Core' }
SequenceableCollection >> shuffledBy: aRandomNumberGenerator [

	^ self copy shuffleBy: aRandomNumberGenerator
]
