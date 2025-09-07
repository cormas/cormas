Class {
	#name : 'CMBrowseSpaceContextMenuCommand',
	#superclass : 'CMSpaceContextMenuCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'accessing' }
CMBrowseSpaceContextMenuCommand >> action [
	^ owner class browse
]

{ #category : 'accessing' }
CMBrowseSpaceContextMenuCommand >> icon [

	^ self iconNamed: #smallSystemBrowser
]

{ #category : 'accessing' }
CMBrowseSpaceContextMenuCommand >> name [

	^ translator tBrowse
]
