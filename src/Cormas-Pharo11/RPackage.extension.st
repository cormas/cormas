Extension { #name : #RPackage }

{ #category : #'*Cormas-Pharo11' }
RPackage >> tagNamed: aString [
	
	^ self classTagNamed: aString
]

{ #category : #'*Cormas-Pharo11' }
RPackage >> tags [
	
	^ self classTags
]
