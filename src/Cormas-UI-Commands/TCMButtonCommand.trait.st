Trait {
	#name : 'TCMButtonCommand',
	#traits : 'TCMCommand',
	#classTraits : 'TCMCommand classTrait',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'converting' }
TCMButtonCommand >> button [

	^ self buttonOfClass: SpButtonPresenter
]

{ #category : 'converting' }
TCMButtonCommand >> buttonOfClass: aClass [

	^ (owner instantiate: aClass)
		label: self name;
		icon: self icon;
		action: [ self action ];
		help: self name;
		yourself
]

{ #category : 'initialization' }
TCMButtonCommand >> initializeWithTranslator: aTranslator owner: aPresenter [

	translator := aTranslator.
	owner := aPresenter
]

{ #category : 'converting' }
TCMButtonCommand >> toolbarButton [

	^ self buttonOfClass: SpToolbarButtonPresenter
]
