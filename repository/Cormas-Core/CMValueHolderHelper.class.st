Class {
	#name : #CMValueHolderHelper,
	#superclass : #CMObjectHelper,
	#category : 'Cormas-Core-Helpers'
}

{ #category : #helping }
CMValueHolderHelper class >> valueFrom: anObjectOrMenuItemOrValueHolder [
	"return either the value of the argument if it is a MenuItem or a ValueHolder or the argument itself "
	
	^ anObjectOrMenuItemOrValueHolder value
]
