Extension { #name : #ZipFileSystemDirectory }

{ #category : #'*Cormas-UI' }
ZipFileSystemDirectory >> asCormasProjectModelForOpening [
	" Answer a <CMProjectModel> using the receiver's metadata "

	| metadata |
	metadata := STON fromStream: (self fileEntryAt: CMProjectFile metadataFilename) readStream.
	^ CMProjectModel forProjectFile: self.
		
]

{ #category : #'*Cormas-UI' }
ZipFileSystemDirectory >> asCormasProjectModelForPreview [
	" Answer a <CMProjectModel> using the receiver's metadata "

	^ CMProjectModel forMetadata: (CMProjectOpener metadataFromProjectFile: self).

]
