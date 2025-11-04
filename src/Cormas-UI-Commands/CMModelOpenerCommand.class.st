Class {
	#name : 'CMModelOpenerCommand',
	#superclass : 'Object',
	#traits : 'TCMButtonCommand',
	#classTraits : 'TCMButtonCommand classTrait',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'testing' }
CMModelOpenerCommand >> isBigButton [
	"By default, those commands are represented with small toolbar buttons. Override this method to display a full button with text and icon"
	
	^ false
]
