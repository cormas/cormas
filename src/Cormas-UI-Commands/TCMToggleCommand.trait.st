Trait {
	#name : 'TCMToggleCommand',
	#instVars : [
		'isOn',
		'button'
	],
	#traits : 'TCMCommand',
	#classTraits : 'TCMCommand classTrait',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'action' }
TCMToggleCommand >> action [

	isOn
		ifTrue: [ self actionWhenOn ]
		ifFalse: [ self actionWhenOff ]
]

{ #category : 'action' }
TCMToggleCommand >> actionWhenOff [

	self subclassResponsibility
]

{ #category : 'action' }
TCMToggleCommand >> actionWhenOn [

	self subclassResponsibility
]

{ #category : 'converting' }
TCMToggleCommand >> createButton [

	button := (owner instantiate: SpToolbarButtonPresenter)
		action: [
			isOn := isOn not.
			self updateLabelAndIcon.
			self action ];
		yourself.
		
	self updateLabelAndIcon
]

{ #category : 'accessing' }
TCMToggleCommand >> icon [

	self shouldNotImplement
]

{ #category : 'accessing' }
TCMToggleCommand >> iconWhenOff [

	self subclassResponsibility
]

{ #category : 'accessing' }
TCMToggleCommand >> iconWhenOn [

	self subclassResponsibility
]

{ #category : 'initialization' }
TCMToggleCommand >> initializeWithTranslator: aTranslator owner: aPresenter [

	translator := aTranslator.
	owner := aPresenter.
	isOn := self isOnByDefault.
	
	self createButton.
]

{ #category : 'testing' }
TCMToggleCommand >> isOnByDefault [

	^ false
]

{ #category : 'accessing' }
TCMToggleCommand >> name [

	self shouldNotImplement
]

{ #category : 'accessing' }
TCMToggleCommand >> nameWhenOff [

	self subclassResponsibility
]

{ #category : 'accessing' }
TCMToggleCommand >> nameWhenOn [

	self subclassResponsibility
]

{ #category : 'converting' }
TCMToggleCommand >> toolbarButton [

	^ button
]

{ #category : 'as yet unclassified' }
TCMToggleCommand >> updateLabelAndIcon [

	button label: (isOn
		ifTrue: [ self nameWhenOn ]
		ifFalse: [ self nameWhenOff ]).
		
	button help: (isOn
		ifTrue: [ self nameWhenOn ]
		ifFalse: [ self nameWhenOff ]).	
		
	button icon: (isOn
		ifTrue: [ self iconWhenOn ]
		ifFalse: [ self iconWhenOff ]).
]
