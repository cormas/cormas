Trait {
	#name : 'TCMToggleCommand',
	#instVars : [
		'isOn'
	],
	#traits : 'TCMCommand',
	#classTraits : 'TCMCommand classTrait',
	#category : 'Cormas-UI-Commands',
	#package : 'Cormas-UI-Commands'
}

{ #category : 'accessing' }
TCMToggleCommand >> action [

	isOn
		ifTrue: [ self actionWhenOn ]
		ifFalse: [ self actionWhenOff ]
]

{ #category : 'accessing' }
TCMToggleCommand >> actionWhenOff [

	self subclassResponsibility
]

{ #category : 'accessing' }
TCMToggleCommand >> actionWhenOn [

	self subclassResponsibility
]

{ #category : 'converting' }
TCMToggleCommand >> createButton [

	button := (owner instantiate: self buttonClass)
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

{ #category : 'as yet unclassified' }
TCMToggleCommand >> iconWhenOff [

	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
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

{ #category : 'as yet unclassified' }
TCMToggleCommand >> nameWhenOff [

	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
TCMToggleCommand >> nameWhenOn [

	self subclassResponsibility
]

{ #category : 'as yet unclassified' }
TCMToggleCommand >> updateLabelAndIcon [

	button label: (isOn
		ifTrue: [ self nameWhenOn ]
		ifFalse: [ self nameWhenOff ]).
		
	button icon: (isOn
		ifTrue: [ self iconWhenOn ]
		ifFalse: [ self iconWhenOff ]).
]
