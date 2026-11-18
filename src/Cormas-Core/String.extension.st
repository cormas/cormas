Extension { #name : 'String' }

{ #category : '*Cormas-Core' }
String >> asCormasImage [
	"Return the image whose file has my name, so that a look can be given an image by its name"

	^ CMImage named: self
]
