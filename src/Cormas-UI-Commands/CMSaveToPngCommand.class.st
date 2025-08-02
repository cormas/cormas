Class {
	#name : 'CMSaveToPngCommand',
	#superclass : 'CMSpacePresenterCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'accessing' }
CMSaveToPngCommand class >> order [

	^ 1
]

{ #category : 'action' }
CMSaveToPngCommand >> action [

	owner saveToPng
]

{ #category : 'accessing' }
CMSaveToPngCommand >> icon [

	^ self iconNamed: #smallSave
]

{ #category : 'accessing' }
CMSaveToPngCommand >> name [

	^ 'Save to PNG'
]
