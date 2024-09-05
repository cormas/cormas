Class {
	#name : 'CMModelOpenerBrowseCommand',
	#superclass : 'CMModelOpenerCommand',
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'accessing' }
CMModelOpenerBrowseCommand >> action [

	^ [ 
		owner selectedModelClass browse.
		owner window close ]
]

{ #category : 'accessing' }
CMModelOpenerBrowseCommand >> icon [

	^ self iconNamed: #smallSystemBrowser
]

{ #category : 'accessing' }
CMModelOpenerBrowseCommand >> name [

	^ translator tBrowse
]
