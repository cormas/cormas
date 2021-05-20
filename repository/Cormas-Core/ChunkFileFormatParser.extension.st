Extension { #name : #ChunkFileFormatParser }

{ #category : #'*Cormas-Core' }
ChunkFileFormatParser class >> chunksFromClass: aClass [
	" Answer a <Collection> with code chunks from aClass "

	^ (self for: aClass chunkOut) parseChunks
]

{ #category : #'*Cormas-Core' }
ChunkFileFormatParser class >> methodChunksFrom: aClass [
	" Answer a <Collection> with code chunks from aClass "

	^ ((self chunksFromClass: aClass) select: #isMethodDeclaration) asSortedCollection
]
