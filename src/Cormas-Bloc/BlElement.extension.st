Extension { #name : 'BlElement' }

{ #category : '*Cormas-Bloc' }
BlElement >> cormasImageScale [
	"Return the pixels per point with which Cormas draws the images of my children: those of the view I am in, or 1 outside a view"

	self hasParent ifFalse: [ ^ 1 ].
	^ self parent cormasImageScale
]
