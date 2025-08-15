Class {
	#name : 'CMModelLoaderUpdateCommand',
	#superclass : 'CMModelLoaderCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'action' }
CMModelLoaderUpdateCommand >> action [

	owner manifest update
]

{ #category : 'accessing' }
CMModelLoaderUpdateCommand >> icon [

	^ self iconNamed: #smallUpdate
]

{ #category : 'testing' }
CMModelLoaderUpdateCommand >> isAvailable [

	^ owner manifest isLoaded
]

{ #category : 'accessing' }
CMModelLoaderUpdateCommand >> name [

	^ 'Update'
]
