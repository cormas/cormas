Extension { #name : #CMAbstractModel }

{ #category : #'*Cormas-UI-Roassal3' }
CMAbstractModel >> initActivePoV: aSpRoassalPresenter [
	" Callback convention to set and refresh the active PoV when the space is opened for the first time. 
	This way will avoid doing the menu PoV setting for setting the VegetationUnit for example. "

	(self initActivePoVClass notNil and: [ self initActivePoVSelector notNil ])
		ifTrue: [ 
			aSpRoassalPresenter 
				setAndRefreshActivePovSelectorOf: self initActivePoVClass 
				with: self initActivePoVSelector ]
]

{ #category : #'*Cormas-UI-Roassal3' }
CMAbstractModel >> initActivePoVClass [ 
	" Answer a <Class> of a CORMAS model. See comment in #initActivePoV:	
	Override this method in your model to set the PoV class which will be used to look up for the selector defined in #initActivePoVSelector when the space is opened "

	^ nil
]

{ #category : #'*Cormas-UI-Roassal3' }
CMAbstractModel >> initActivePoVSelector [
	" Answer a <Symbol> representing a selector. See comment in #initActivePoV: 
	Override this method in your model to set the PoV selector which will be sent to the class defined in #initActivePoVClass when the space is opened "
	
	^ nil
]
