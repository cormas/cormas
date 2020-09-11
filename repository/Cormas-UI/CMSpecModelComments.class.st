"
CMSpecModelComments example.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.


    Implementation Points
"
Class {
	#name : #CMSpecModelComments,
	#superclass : #CMSpecObject,
	#instVars : [
		'authorList',
		'modelText',
		'versionName',
		'toolbar',
		'creationDate'
	],
	#category : #'Cormas-UI-Core'
}

{ #category : #specs }
CMSpecModelComments class >> defaultSpec [

	^ SpecLayout composed
		newColumn: [ : c  |
				c newRow: [ : s |
					s
						add: #versionName;
						add: #creationDate ] height: self toolbarHeight;
				add: #authorList;
				add: #modelText;
				add: #toolbar height: self toolbarHeight ];
		yourself 
		
		
		
]

{ #category : #callbacks }
CMSpecModelComments >> addModelComments [
	" Private - User has clicked Ok to add model comments "

	self projectManager 
		cormasModelCreationDate: self creationDate textValuePending;
		cormasModelVersion: self versionName textValuePending;
		cormasModelAuthors: self authorList textValuePending;
		cormasModelText: self modelText textValuePending.
	self projectAnnouncer announce: CMProjectUpdateAnnouncement new

]

{ #category : #accessing }
CMSpecModelComments >> authorList [
	" Answer a <CMGrowableAuthorList> "

	^ authorList
]

{ #category : #accessing }
CMSpecModelComments >> authorList: anObject [
	authorList := anObject
]

{ #category : #accessing }
CMSpecModelComments >> creationDate [
	^ creationDate
]

{ #category : #accessing }
CMSpecModelComments >> creationDate: anObject [
	creationDate := anObject
]

{ #category : #initialization }
CMSpecModelComments >> currentProjectAuthors [
	" See comment in ProjectManager #currentProjectAuthors method "
	
	^ self projectManager currentProjectAuthors
]

{ #category : #initialization }
CMSpecModelComments >> currentProjectClass [
	" See comment in ProjectManager #currentProjectVersion method "
	
	^ self currentProject cormasModelClass
]

{ #category : #initialization }
CMSpecModelComments >> currentProjectVersion [
	" See comment in ProjectManager #currentProjectVersion method "
	
	^ self projectManager currentProjectVersion
]

{ #category : #defaults }
CMSpecModelComments >> defaultAuthorList [
	" Answer a <String> with some default text for authors list "
	
	^ 'Author1;email1@author1.com
Author2;email2@author2.com
'
]

{ #category : #defaults }
CMSpecModelComments >> defaultVersionName [

	^ '1.0'
]

{ #category : #api }
CMSpecModelComments >> initialExtent [
	"Answer the initial extent for the receiver."
	
	^ 600 @ 400
]

{ #category : #initialization }
CMSpecModelComments >> initializeAuthors [

	self authorList
		label: self translator tVersionName.
	self authorList text: (self projectManager currentProjectHasAuthor
		ifTrue: [  self currentProjectAuthors ]
		ifFalse: [ self defaultAuthorList ])
]

{ #category : #initialization }
CMSpecModelComments >> initializeCreationDateField [

	self creationDate 
		label: self translator tCreationDate;
		ghostText: Date today asString.
	self projectManager currentProjectHasCreationDate
		ifTrue: [ self creationDate textValue: self projectManager currentProjectCreationDate ].
	self creationDate disable
]

{ #category : #initialization }
CMSpecModelComments >> initializeModelComments [

	self modelText
		label: self translator tModelComments.
	self projectManager currentProjectHasComments
		ifTrue: [ self modelText text: self cormasModelClass comments ].

]

{ #category : #initialization }
CMSpecModelComments >> initializePresenter [
	" Private - See superimplementor's comment "
	
	self 
		initializeVersionField;
		initializeCreationDateField;
		initializeModelComments;
		initializeAuthors;
		initializeToolbar.
]

{ #category : #initialization }
CMSpecModelComments >> initializeToolbar [

	self toolbar 
"		firstButtonLabel: 'Cancel';
		firstButtonAction: [ self delete ];"
		firstButtonLabel: 'Ok';
		firstButtonAction: [ 
			self addModelComments.
			self delete ]
]

{ #category : #initialization }
CMSpecModelComments >> initializeVersionField [

	self versionName
		label: self translator tVersionName;
		ghostText: self defaultVersionName.
	self projectManager currentProjectHasVersion
		ifTrue: [ self versionName textValue: self currentProjectVersion ].
]

{ #category : #initialization }
CMSpecModelComments >> initializeWidgets [
	" Private - See superimplementor's comment "
	
	self instantiateModels: #(
		versionName 			SpcLabeledTextField
		creationDate 		SpcLabeledTextField
		authorList 			SpcLabeledTextArea
		modelText 			SpcLabeledTextArea
		toolbar 				SpcOneButtonToolbar
		).
	self focusOrder 
		add: self versionName;
		add: self authorList;
		add: self toolbar.
]

{ #category : #accessing }
CMSpecModelComments >> modelText [
	^ modelText
]

{ #category : #accessing }
CMSpecModelComments >> modelText: anObject [
	modelText := anObject
]

{ #category : #api }
CMSpecModelComments >> title [
	" Private - See superimplementor's comment "

	^ self translator tModelComments
]

{ #category : #accessing }
CMSpecModelComments >> toolbar [
	^ toolbar
]

{ #category : #accessing }
CMSpecModelComments >> toolbar: anObject [
	toolbar := anObject
]

{ #category : #accessing }
CMSpecModelComments >> versionName [
	" Answer a <SpcLabeledTextField> with version information "

	^ versionName
]

{ #category : #accessing }
CMSpecModelComments >> versionName: anObject [
	versionName := anObject
]
