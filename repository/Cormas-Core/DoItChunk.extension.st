Extension { #name : #DoItChunk }

{ #category : #'*Cormas-Core' }
DoItChunk >> <= aMethodChunk [
	" Use sorting by description as the default sort order "

	^ self description <= aMethodChunk description
]

{ #category : #'*Cormas-Core' }
DoItChunk >> = aCodeChunk [
	
	self == aCodeChunk 
		ifTrue: [ ^ true ].
	self class = aCodeChunk class
		ifFalse: [ ^ false ].	
	((self contents beginsWith: '''From Pharo') and: [ aCodeChunk contents beginsWith: '''From Pharo' ])
		ifTrue: [ ^ true ].
	^ self contents lines = aCodeChunk contents lines
]

{ #category : #'*Cormas-Core' }
DoItChunk >> hash [ 

	^ self class hash bitXor: self contents hash

]
