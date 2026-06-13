Class {
	#name : 'CMDataPresenterCommand',
	#superclass : 'Object',
	#traits : 'TCMButtonCommand',
	#classTraits : 'TCMButtonCommand classTrait',
	#instVars : [
		'cormasIconProvider'
	],
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'accessing' }
CMDataPresenterCommand >> cormasIconProvider: anIconProvider [

	cormasIconProvider := anIconProvider
]
