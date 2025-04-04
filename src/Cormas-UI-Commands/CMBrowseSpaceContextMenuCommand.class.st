Class {
	#name : 'CMBrowseSpaceContextMenuCommand',
	#superclass : 'CMSpaceContextMenuCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'accessing' }
CMBrowseSpaceContextMenuCommand class >> order [

	^ 3
]

{ #category : 'accessing' }
CMBrowseSpaceContextMenuCommand >> action [

	owner class browse
]

{ #category : 'accessing' }
CMBrowseSpaceContextMenuCommand >> icon [

	^ self iconNamed: #smallFind
]

{ #category : 'accessing' }
CMBrowseSpaceContextMenuCommand >> name [

	^ 'Browse'
]
