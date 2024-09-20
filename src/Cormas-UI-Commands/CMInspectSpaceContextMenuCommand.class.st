Class {
	#name : 'CMInspectSpaceContextMenuCommand',
	#superclass : 'CMSpaceContextMenuCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'accessing' }
CMInspectSpaceContextMenuCommand class >> order [

	^ 1
]

{ #category : 'accessing' }
CMInspectSpaceContextMenuCommand >> action [

	owner inspect 
]

{ #category : 'accessing' }
CMInspectSpaceContextMenuCommand >> icon [

	^ self iconNamed: #smallInspectIt 
]

{ #category : 'accessing' }
CMInspectSpaceContextMenuCommand >> name [

	^ 'Inspect'
]
