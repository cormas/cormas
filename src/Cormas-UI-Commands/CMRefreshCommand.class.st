Class {
	#name : 'CMRefreshCommand',
	#superclass : 'CMSpacePresenterCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'accessing' }
CMRefreshCommand >> action [

	owner updateDiagram
]

{ #category : 'accessing' }
CMRefreshCommand >> icon [

	^ self iconNamed: #glamorousRefresh 
]

{ #category : 'accessing' }
CMRefreshCommand >> name [

	^ 'Refresh'
]
