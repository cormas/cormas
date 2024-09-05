Extension { #name : 'RSShape' }

{ #category : '*Cormas-UI-Roassal3' }
RSShape >> cormasModel [
	
	^ self model.
]

{ #category : '*Cormas-UI-Roassal3' }
RSShape >> updateEntityAspectIn: aCMR3SpacePresenter [ 

	| pov |
	
	pov := self model perform: aCMR3SpacePresenter activeSpatialEntityPov.
	self color: pov color.
	self signalUpdate.

]
