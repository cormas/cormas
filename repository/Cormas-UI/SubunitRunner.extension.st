Extension { #name : #SubunitRunner }

{ #category : #'*Cormas-UI' }
SubunitRunner class >> runAndCollectPackages: aCollectionOfStrings [

	^ aCollectionOfStrings collect: [ :each | self runPackage: each ]
]

{ #category : #'*Cormas-UI' }
SubunitRunner class >> runPackage: aString [

	^ self runClasses: (RPackage organizer packageNamed: aString) classes named: aString
]
