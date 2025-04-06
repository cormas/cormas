Extension { #name : #SpStringTableColumn }

{ #category : #'*Cormas-Pharo11' }
SpStringTableColumn >> onTextChanged: aBlock [
	"Not the same behavior but makes Cormas work on Pharo 11"
	self onAcceptEdition: aBlock
]
