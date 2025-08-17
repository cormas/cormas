Class {
	#name : 'CMModelOpenerBrowseCommand',
	#superclass : 'CMModelOpenerCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'accessing' }
CMModelOpenerBrowseCommand class >> order [ 

	^ 100
]

{ #category : 'action' }
CMModelOpenerBrowseCommand >> action [

	owner cormasModelClass browse
]

{ #category : 'accessing' }
CMModelOpenerBrowseCommand >> icon [

	^ self iconNamed: #smallSystemBrowser
]

{ #category : 'accessing' }
CMModelOpenerBrowseCommand >> name [

	^ translator tBrowse
]
