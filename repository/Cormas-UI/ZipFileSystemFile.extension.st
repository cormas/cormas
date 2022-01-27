Extension { #name : #ZipFileSystemFile }

{ #category : #'*Cormas-UI' }
ZipFileSystemFile >> forCormasProjectDemo [

	| reader |
	reader := GIFReadWriter on: self binaryReadStream .
	reader
		readHeader;
		readBody.
	^ (AnimatedImageMorph fromGIFReader: reader)
			hResizing: #spaceFill;
			vResizing: #spaceFill;
			yourself
]
