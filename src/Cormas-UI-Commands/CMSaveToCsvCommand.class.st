Class {
	#name : 'CMSaveToCsvCommand',
	#superclass : 'CMDataPresenterCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'accessing' }
CMSaveToCsvCommand >> action [
	owner saveToCsv
]

{ #category : 'accessing' }
CMSaveToCsvCommand >> icon [

	^ CMIcons csvIcon
]

{ #category : 'accessing' }
CMSaveToCsvCommand >> name [

	^ translator tSaveToCsv
]
