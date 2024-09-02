Extension { #name : 'RSShape' }

{ #category : '*Cormas-UI-Roassal3' }
RSShape >> cormasModel [
	
	^ self model.
]

{ #category : '*Cormas-UI-Roassal3' }
RSShape >> updateEntityAspectIn: aCMR3SpacePresenter [ 

	| colorSymbolOrNumber |
	
	colorSymbolOrNumber := self model perform: aCMR3SpacePresenter activeSpatialEntityPov.
	self color: (colorSymbolOrNumber asColorForPoVIn: self model).
	self signalUpdate.

]
