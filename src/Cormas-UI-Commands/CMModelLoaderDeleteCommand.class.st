Class {
	#name : 'CMModelLoaderDeleteCommand',
	#superclass : 'CMModelLoaderCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'action' }
CMModelLoaderDeleteCommand >> action [ 

	owner manifest delete.
	owner signalUpdate
]

{ #category : 'accessing' }
CMModelLoaderDeleteCommand >> icon [

	^ self iconNamed: #smallDelete
]

{ #category : 'testing' }
CMModelLoaderDeleteCommand >> isAvailable [

	^ owner manifest isLoaded
]

{ #category : 'accessing' }
CMModelLoaderDeleteCommand >> name [
	
	^ 'Delete'
]
