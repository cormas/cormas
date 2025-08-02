Class {
	#name : 'CMFullscreenCommand',
	#superclass : 'CMSpacePresenterToggleCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'action' }
CMFullscreenCommand >> actionWhenOff [

	owner showSettings
]

{ #category : 'action' }
CMFullscreenCommand >> actionWhenOn [

	owner hideSettings
]

{ #category : 'accessing' }
CMFullscreenCommand >> iconWhenOff [

	^ self iconNamed: #smallFullscreen
]

{ #category : 'accessing' }
CMFullscreenCommand >> iconWhenOn [

	^ self iconNamed: #smallFullscreen
]

{ #category : 'accessing' }
CMFullscreenCommand >> nameWhenOff [

	^ 'Fullscreen'
]

{ #category : 'accessing' }
CMFullscreenCommand >> nameWhenOn [

	^ 'Fullscreen'
]
