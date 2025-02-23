Extension { #name : #CompiledMethod }

{ #category : #'*Cormas-Pharo11' }
CompiledMethod >> valueWithReceiver: anObject [

	^ self valueWithReceiver: anObject arguments: #()
]
