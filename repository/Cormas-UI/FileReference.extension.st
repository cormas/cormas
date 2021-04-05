Extension { #name : #FileReference }

{ #category : #'*Cormas-UI' }
FileReference >> asCMProjectModel [
	
	| zipFileSys |
	
	zipFileSys := (ZipStore reference: self) open root.
	(#( #sourceCodeFilenameWithExtension #metadataFilename)
		allSatisfy: [ : selector | zipFileSys fileEntriesIncludes: (CMProjectFile perform: selector) ])
			ifFalse: [ self error: 'CORMAS project file missing files' ].
	^ zipFileSys asCMProjectModel 
		fileName: self fullName;
		yourself
]

{ #category : #'*Cormas-UI' }
FileReference >> asCormasProjectName [
	" Answer a <String> with the receiver's name "

	^ self basenameWithoutExtension
]

{ #category : #'*Cormas-UI' }
FileReference >> definedCormasVersions [
	" For now we return a CMProjectModel but we should support versions "

	^ Array with: self asCMProjectModel
]
