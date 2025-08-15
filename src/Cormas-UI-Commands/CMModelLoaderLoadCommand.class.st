Class {
	#name : 'CMModelLoaderLoadCommand',
	#superclass : 'CMModelLoaderCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'action' }
CMModelLoaderLoadCommand >> action [ 

	owner manifest load. 
	owner signalUpdate
]

{ #category : 'accessing' }
CMModelLoaderLoadCommand >> icon [ 

	^ self iconNamed: #smallLoadProject
]

{ #category : 'testing' }
CMModelLoaderLoadCommand >> isAvailable [

	^ owner manifest isLoaded not
]

{ #category : 'accessing' }
CMModelLoaderLoadCommand >> name [

	^ 'Load'
]
