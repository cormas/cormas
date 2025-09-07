Extension { #name : #RPackageOrganizer }

{ #category : #'*Cormas-Pharo11' }
RPackageOrganizer >> hasPackage: aPackage [
	"Takes a package or a package name as parameter and return true if I include this package."

	^ aPackage isString
		  ifTrue: [
			  self packageNamed: aPackage asSymbol ifAbsent: [ ^ false ].
			  ^ true ]
		  ifFalse: [ self packages includes: aPackage ]
]

{ #category : #'*Cormas-Pharo11' }
RPackageOrganizer >> packageNamed: aSymbol ifPresent: aBlock [
	"We first look at the fast solution then we try the case insensitive way because we do not care about the case in this package manager."

	^ packages
		  at: aSymbol asSymbol
		  ifPresent: aBlock
		  ifAbsent: [
			  self packagesDo: [ :each | (each name sameAs: aSymbol) ifTrue: [ ^ aBlock cull: each ] ].
			  nil ]
]

{ #category : #'*Cormas-Pharo11' }
RPackageOrganizer >> removePackage: aPackage [

	self
		packageNamed: (aPackage isString
				 ifTrue: [ aPackage ]
				 ifFalse: [ aPackage name ])
		ifPresent: [ :package | package removeFromSystem ]
]
