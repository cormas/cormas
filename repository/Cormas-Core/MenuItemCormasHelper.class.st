"
helper class for menu items
"
Class {
	#name : #MenuItemCormasHelper,
	#superclass : #Object,
	#category : 'Cormas-Core-Interface'
}

{ #category : #helping }
MenuItemCormasHelper class >> valueFrom: anObjectOrMenuItemOrValueHolder [
	"return either the value of the argument if it is a MenuItem or a ValueHolder or the argument itself "
	
	^anObjectOrMenuItemOrValueHolder value
]
