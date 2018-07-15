"
helper class for value holders
"
Class {
	#name : #ValueHolderCormasHelper,
	#superclass : #ObjectCormasHelper,
	#category : 'Cormas-VW-Ported'
}

{ #category : #helping }
ValueHolderCormasHelper class >> valueFrom: anObjectOrMenuItemOrValueHolder [
	"return either the value of the argument if it is a MenuItem or a ValueHolder or the argument itself "
	
	^anObjectOrMenuItemOrValueHolder value
]
