Class {
	#name : #CMSpMetaProjectPresenter,
	#superclass : #CMSpPManagedPresenter,
	#instVars : [
		'name',
		'language',
		'model',
		'version',
		'demo',
		'creationDate',
		'filePath',
		'fileSize',
		'hasStoredSimulations',
		'creator',
		'comments'
	],
	#category : #'Cormas-UI-Project-Spec2'
}

{ #category : #specs }
CMSpMetaProjectPresenter class >> defaultSpec [

	^ SpBoxLayout newVertical
		add: (SpBoxLayout newHorizontal
				add: #name;
				add: #creator;
				yourself) withConstraints: [ :constraints | constraints height: self inputTextHeight ];
		add: (SpBoxLayout newHorizontal
				add: #version;
				add: #creationDate;
				yourself)  withConstraints: [ :constraints | constraints height: self inputTextHeight ];
		add: #filePath withConstraints: [ :constraints | constraints height: self inputTextHeight ];
		add: (SpBoxLayout newHorizontal
				add: #fileSize;
				add: #language;
				yourself) withConstraints: [ :constraints | constraints height: self inputTextHeight ];
		add: (SpBoxLayout newHorizontal
				add: #demo;
				add: #hasStoredSimulations;
				yourself) withConstraints: [ :constraints | constraints height: self inputTextHeight ];
		add: #comments 			
			expand: true
			fill: false
			padding: 0;
		yourself
]

{ #category : #accessing }
CMSpMetaProjectPresenter >> comments [
	^ comments
]

{ #category : #accessing }
CMSpMetaProjectPresenter >> comments: anObject [
	comments := anObject
]

{ #category : #accessing }
CMSpMetaProjectPresenter >> creationDate [
	^ creationDate
]

{ #category : #accessing }
CMSpMetaProjectPresenter >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #accessing }
CMSpMetaProjectPresenter >> creator [
	^ creator
]

{ #category : #accessing }
CMSpMetaProjectPresenter >> creator: anObject [
	creator := anObject
]

{ #category : #'accessing model' }
CMSpMetaProjectPresenter >> defineInputPorts [
	
	^ { SpModelPort new }
]

{ #category : #accessing }
CMSpMetaProjectPresenter >> demo [
	^ demo
]

{ #category : #accessing }
CMSpMetaProjectPresenter >> demo: anObject [
	demo := anObject
]

{ #category : #accessing }
CMSpMetaProjectPresenter >> filePath [
	^ filePath
]

{ #category : #accessing }
CMSpMetaProjectPresenter >> filePath: anObject [
	filePath := anObject
]

{ #category : #accessing }
CMSpMetaProjectPresenter >> fileSize [
	^ fileSize
]

{ #category : #accessing }
CMSpMetaProjectPresenter >> fileSize: anObject [
	fileSize := anObject
]

{ #category : #accessing }
CMSpMetaProjectPresenter >> hasStoredSimulations [
	^ hasStoredSimulations
]

{ #category : #accessing }
CMSpMetaProjectPresenter >> hasStoredSimulations: anObject [
	hasStoredSimulations := anObject
]

{ #category : #accessing }
CMSpMetaProjectPresenter >> initializePresenters [
		
	name := self instantiate: (SpLabelledPresenter 
		label: 'Name' 
		input: self newTextInput).
	version := self instantiate: (SpLabelledPresenter 
		label: 'Version' 
		input: self newTextInput).	
	creationDate := self instantiate: (SpLabelledPresenter 
		label: 'Creation Date' 
		input: self newTextInput).
	filePath := self instantiate: (SpLabelledPresenter 
		label: 'Path' 
		input: self newLink).
	fileSize:= self instantiate: (SpLabelledPresenter 
		label: 'Size' 
		input: self newLink).
	language := self instantiate: (SpLabelledPresenter 
		label: 'Language' 
		input: self newTextInput).
	demo := self newCheckBox
		label: 'Is demo';
		state: false;
		yourself.
	hasStoredSimulations := self newCheckBox
		label: 'Has stored simulations';
		state: false;
		yourself.
	creator := self instantiate: (SpLabelledPresenter 
		label: 'Creator' 
		input: self newTextInput).
	comments := (self instantiate: (SpLabelledPresenter 
		label: 'Comments' "self translator tModelComments "
		input: self newText))
			enabled: false.
	
	self focusOrder 
		add: name; 
		add: language
]

{ #category : #accessing }
CMSpMetaProjectPresenter >> language [
	^ language
]

{ #category : #accessing }
CMSpMetaProjectPresenter >> language: anObject [
	language := anObject
]

{ #category : #accessing }
CMSpMetaProjectPresenter >> model [
	^ model
]

{ #category : #accessing }
CMSpMetaProjectPresenter >> model: anObject [
	model := anObject
]

{ #category : #accessing }
CMSpMetaProjectPresenter >> name [
	^ name
]

{ #category : #accessing }
CMSpMetaProjectPresenter >> name: anObject [
	name := anObject
]

{ #category : #'accessing model' }
CMSpMetaProjectPresenter >> setModel: aDomainObject [

	^	self model: aDomainObject
]

{ #category : #accessing }
CMSpMetaProjectPresenter >> version [
	^ version
]

{ #category : #accessing }
CMSpMetaProjectPresenter >> version: anObject [
	version := anObject
]
