Class {
	#name : 'CMKillSpaceContextMenuCommand',
	#superclass : 'CMSpaceContextMenuCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'accessing' }
CMKillSpaceContextMenuCommand class >> order [

	^ 2
]

{ #category : 'accessing' }
CMKillSpaceContextMenuCommand >> action [

	owner die
]

{ #category : 'accessing' }
CMKillSpaceContextMenuCommand >> icon [

	^ self iconNamed: #delete
]

{ #category : 'accessing' }
CMKillSpaceContextMenuCommand >> name [

	^ 'Kill'
]
