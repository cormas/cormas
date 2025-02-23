Class {
	#name : 'CMFullscreenCommand',
	#superclass : 'CMSpacePresenterToggleCommand',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'accessing' }
CMFullscreenCommand >> actionWhenOff [

	owner showSettings
]

{ #category : 'accessing' }
CMFullscreenCommand >> actionWhenOn [

	owner hideSettings
]

{ #category : 'as yet unclassified' }
CMFullscreenCommand >> iconWhenOff [

	^ self iconNamed: #smallFullscreen
]

{ #category : 'as yet unclassified' }
CMFullscreenCommand >> iconWhenOn [

	^ self iconNamed: #smallFullscreen
]

{ #category : 'as yet unclassified' }
CMFullscreenCommand >> nameWhenOff [

	^ 'Fullscreen'
]

{ #category : 'as yet unclassified' }
CMFullscreenCommand >> nameWhenOn [

	^ 'Fullscreen'
]
