Extension { #name : #CodeImporter }

{ #category : #'*Cormas-Core' }
CodeImporter class >> methodChunksFromFileNamed: aFilename [
	" Answer a <Collection> with method chunks from aFilename "

	^ ((self chunksFromFileNamed: aFilename) select: #isMethodDeclaration) asSortedCollection
]

{ #category : #'*Cormas-Core' }
CodeImporter class >> methodChunksFromStream: aReadStream [
	" Answer a <Collection> with method chunks from aFilename "

	aReadStream reset.
	^ ((self chunksFromStream: aReadStream) select: #isMethodDeclaration) asSortedCollection
]
