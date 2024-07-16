Extension { #name : #CodeChunk }

{ #category : #'*Cormas-Core' }
CodeChunk >> = aCodeChunk [

	self == aCodeChunk 
		ifTrue: [ ^ true ].
	self class = aCodeChunk class
		ifFalse: [ ^ false ].	
	^ self contents lines = aCodeChunk contents lines
]

{ #category : #'*Cormas-Core' }
CodeChunk >> hash [

	^  self class hash bitXor: self contents hash
]
