Class {
	#name : 'CMModelLoaderLoadCommand',
	#superclass : 'CMModelLoaderCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'action' }
CMModelLoaderLoadCommand >> action [ 

	owner manifest load. 
	owner onModelLoaded
]

{ #category : 'accessing' }
CMModelLoaderLoadCommand >> icon [ 

	^ self iconNamed: #smallLoadProject
]

{ #category : 'accessing' }
CMModelLoaderLoadCommand >> name [

	^ 'Load'
]
