Extension { #name : #MethodChunk }

{ #category : #'*Cormas-Core' }
MethodChunk >> <= aMethodChunk [
	" Use sorting by method selector as the default sort order "

	^ self methodSelector <= aMethodChunk methodSelector
]

{ #category : #'*Cormas-Core' }
MethodChunk >> = aCodeChunk [
	" Two method chunks are equal if they belong to the same category and their code are equal "

	self category = aCodeChunk category
		ifFalse: [ ^ false ].
	^ super = aCodeChunk

]

{ #category : #'*Cormas-Core' }
MethodChunk >> hash [ 
	" Private - Answer an integer value that is related to the identity of the receiver."

	^ self category hash

]

{ #category : #'*Cormas-Core' }
MethodChunk >> isTest [
	" Answer <true> if the receiver's is a test method "
	
	^ { self methodSelector . self behaviorName }
		anySatisfy: [ : str | str asLowercase endsWith: 'test' ]
]
