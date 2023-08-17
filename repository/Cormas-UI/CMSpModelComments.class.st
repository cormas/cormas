Class {
	#name : #CMSpModelComments,
	#superclass : #CMSpPresenter,
	#traits : 'TCMUIUtils',
	#classTraits : 'TCMUIUtils classTrait',
	#instVars : [
		'versionNameLabel',
		'versionName',
		'creationDateLabel',
		'creationDate',
		'authorsLabel',
		'addAuthorButton',
		'authorsTable',
		'modelCommentLabel',
		'modelCommentText',
		'okButton'
	],
	#category : #'Cormas-UI-Spec2'
}

{ #category : #specs }
CMSpModelComments class >> defaultSpec [

	^ SpBoxLayout newVertical
		spacing: 4;
		add: (SpBoxLayout newHorizontal
			spacing: 4;
			add: #versionNameLabel width: self labelWidth;
			add: #versionName;
			add: #creationDateLabel width: self labelWidth;
			add: #creationDate;
			yourself) height: self buttonHeight;
		add: (SpBoxLayout newHorizontal
			add: #authorsLabel;
			add: #addAuthorButton width: self buttonHeight;
			yourself) height: self buttonHeight;
		add: #authorsTable;
		add: #modelCommentLabel height: self labelHeight;
		add: #modelCommentText;
		add: (SpBoxLayout newHorizontal
			add: '';
			add: #okButton width: self buttonWidth;
			yourself) height: self buttonHeight;
		yourself.
]

{ #category : #examples }
CMSpModelComments class >> example [

	<example>
	| model projectModel projectManager |
	
	model := CMMockModel new.

	projectModel := CMProjectModel for: model.

	projectManager := CMProjectManager new
		currentProject: projectModel;
		yourself.
	
	(self for: model) openWithSpec.
]

{ #category : #'instance creation' }
CMSpModelComments class >> for: aCormasModel [

	^ self basicNew
		cormasModel: aCormasModel;
		initialize;
		yourself
]

{ #category : #adding }
CMSpModelComments >> addAuthorRow [

	authorsTable items: (authorsTable items copyWith: {
		self defaultAuthorName .
		self defaultAuthorEmail }).
]

{ #category : #adding }
CMSpModelComments >> addModelComments [
	" Private - User has clicked Ok to add model comments "

	self cormasModel 
		creationDate: self creationDate text;
		version: self versionName text;
		authors: self authorsTableAsString;
		comment: self modelCommentText text.
		
	self projectAnnouncer announce: CMProjectUpdateAnnouncement new

]

{ #category : #accessing }
CMSpModelComments >> authorsLabel [

	^ authorsLabel
]

{ #category : #accessing }
CMSpModelComments >> authorsTable [

	^ authorsTable
]

{ #category : #accessing }
CMSpModelComments >> authorsTable: anObject [

	authorsTable := anObject
]

{ #category : #'as yet unclassified' }
CMSpModelComments >> authorsTableAsString [

	^ String cr join: (authorsTable items collect: [ :row | ';' join: row ])
]

{ #category : #accessing }
CMSpModelComments >> creationDate [

	^ creationDate
]

{ #category : #accessing }
CMSpModelComments >> creationDate: anObject [

	creationDate := anObject
]

{ #category : #accessing }
CMSpModelComments >> creationDateLabel [

	^ creationDateLabel
]

{ #category : #defaults }
CMSpModelComments >> defaultAuthorEmail [
	
	^ 'email@author.com'
]

{ #category : #defaults }
CMSpModelComments >> defaultAuthorName [
	
	^ 'Author'
]

{ #category : #defaults }
CMSpModelComments >> defaultVersionName [

	^ '1.0'
]

{ #category : #initialization }
CMSpModelComments >> initialExtent [
	"Answer the initial extent for the receiver."
	
	^ 600 @ 400
]

{ #category : #initialization }
CMSpModelComments >> initializePresenters [

	versionNameLabel := self newLabel
		label: self translator tVersionName;
		yourself.
		
	versionName := self newTextInput
		text: self defaultVersionName;
		yourself.
	
	creationDateLabel := self newLabel
		label: self translator tCreationDate;
		yourself.
	
	creationDate := self newTextInput
		text: Date today asString;
		yourself.
		
	self cormasModel creationDate ifNotNil: [ :aString |
		creationDate text: aString ].
	
	authorsLabel := self newLabel
		label: self translator tAuthors;
		yourself.
		
	addAuthorButton := self newButton
		icon: (self iconNamed: #add);
		action: [ self addAuthorRow ];
		yourself.
	
	authorsTable := self newTable
		addColumn: ((SpStringTableColumn 
			title: self translator tName
			evaluated: [ :row | row first ])
			beEditable;
			yourself);
		addColumn: ((SpStringTableColumn
			title: self translator tEmail
			evaluated: [ :row | row second ])
			beEditable;
			yourself);
		yourself.
		
	self addAuthorRow.
		
	modelCommentLabel := self newLabel
		label: self translator tModelComments;
		yourself.
		
	modelCommentText := self newText.
	
	okButton := self newButton
		label: self translator tOk;
		action: [ 
			self addModelComments.
			self delete ];
		yourself.
	
]

{ #category : #accessing }
CMSpModelComments >> modelCommentLabel [

	^ modelCommentLabel
]

{ #category : #accessing }
CMSpModelComments >> modelCommentText [

	^ modelCommentText
]

{ #category : #accessing }
CMSpModelComments >> modelCommentText: anObject [

	modelCommentText := anObject
]

{ #category : #accessing }
CMSpModelComments >> okButton [

	^ okButton
]

{ #category : #accessing }
CMSpModelComments >> okButton: anObject [

	okButton := anObject
]

{ #category : #accessing }
CMSpModelComments >> projectAnnouncer [
	" Private - Answer the <Announcer> used by the receiver's project "

	^ self projectManager announcer 
]

{ #category : #accessing }
CMSpModelComments >> title [

	^ self formattedWindowTitle: self translator tModelComments
]

{ #category : #accessing }
CMSpModelComments >> versionName [

	^ versionName
]

{ #category : #accessing }
CMSpModelComments >> versionName: anObject [

	versionName := anObject
]

{ #category : #accessing }
CMSpModelComments >> versionNameLabel [

	^ versionNameLabel
]
