Class {
	#name : 'CMInspectSpaceContextMenuCommand',
	#superclass : 'CMSpaceContextMenuCommand',
	#instVars : [
		'inspectBlock'
	],
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'accessing' }
CMInspectSpaceContextMenuCommand class >> order [

	^ 1
]

{ #category : 'action' }
CMInspectSpaceContextMenuCommand >> action [

	inspectBlock value: owner
]

{ #category : 'accessing' }
CMInspectSpaceContextMenuCommand >> icon [

	^ self iconNamed: #smallInspectIt 
]

{ #category : 'initialization' }
CMInspectSpaceContextMenuCommand >> inspectWith: aBlock [
	"Evaluate aBlock with my owner, an entity, to inspect it"

	inspectBlock := aBlock
]

{ #category : 'accessing' }
CMInspectSpaceContextMenuCommand >> name [

	^ 'Inspect'
]
