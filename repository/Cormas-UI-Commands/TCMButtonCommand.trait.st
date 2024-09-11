Trait {
	#name : 'TCMButtonCommand',
	#instVars : [
		'button'
	],
	#traits : 'TCMCommand',
	#classTraits : 'TCMCommand classTrait',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'converting' }
TCMButtonCommand >> button [

	^ button
]

{ #category : 'as yet unclassified' }
TCMButtonCommand >> buttonClass [

	^ SpToolbarButtonPresenter
]

{ #category : 'initialization' }
TCMButtonCommand >> createButton [

	button := (owner instantiate: self buttonClass)
		label: self name;
		icon: self icon;
		action: [ self action ];
		yourself
]

{ #category : 'initialization' }
TCMButtonCommand >> initializeWithTranslator: aTranslator owner: aPresenter [

	translator := aTranslator.
	owner := aPresenter.
	
	self createButton
]
