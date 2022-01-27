Extension { #name : #SubunitRunner }

{ #category : #'*Cormas-UI' }
SubunitRunner class >> runAndCollectCormasPackages: aCollectionOfStrings [

	^ aCollectionOfStrings collect: [ :each | self runCormasPackage: each ]
]

{ #category : #'*Cormas-UI' }
SubunitRunner class >> runAndCollectPackages: aCollectionOfStrings [

	^ aCollectionOfStrings collect: [ :each | self runPackage: each ]
]

{ #category : #'*Cormas-UI' }
SubunitRunner class >> runCormasPackage: aString [

	| cmClasses |
	
	cmClasses := (RPackage organizer packageNamed: aString) classes 
		select: [ : each | each name beginsWithAnyOf: #('CM' 'Cormas') ].
	^ self 
		runClasses: cmClasses
		named: aString
]

{ #category : #'*Cormas-UI' }
SubunitRunner class >> runPackage: aString [

	^ self runClasses: (RPackage organizer packageNamed: aString) classes named: aString
]
