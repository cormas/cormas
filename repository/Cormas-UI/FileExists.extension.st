Extension { #name : #FileExists }

{ #category : #'*Cormas-UI' }
FileExists >> ensureDelete [ 

	^ self fileReference ensureDelete
]

{ #category : #'*Cormas-UI' }
FileExists >> fileReference [ 

	^ self fullName asFileReference
]

{ #category : #'*Cormas-UI' }
FileExists >> fullName [ 

	^ self reference fullName
]
