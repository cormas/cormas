Class {
	#name : 'CMModelLoaderDeleteCommand',
	#superclass : 'CMModelLoaderCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'action' }
CMModelLoaderDeleteCommand >> action [ 

	owner manifest delete
]

{ #category : 'accessing' }
CMModelLoaderDeleteCommand >> icon [

	^ self iconNamed: #smallDelete
]

{ #category : 'accessing' }
CMModelLoaderDeleteCommand >> name [
	
	^ 'Delete'
]
