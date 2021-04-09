Extension { #name : #ZipFileSystemDirectory }

{ #category : #'*Cormas-UI' }
ZipFileSystemDirectory >> asCormasProjectModelForPreview [
	" Answer a <CMProjectModel> using the receiver's metadata "

	^ CMProjectModel forMetadata: (CMProjectOpener metadataFromProjectFile: self).

]
