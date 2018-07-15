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
	#category : 'Cormas-UI-Core'
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
		cormasModelAuthors: self authorList authors;
		cormasModelEmails: self authorList emails;
		cormasModelText: self modelText textValuePending.
		

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

{ #category : #api }
CMSpecModelComments >> initialExtent [
	"Answer the initial extent for the receiver."
	
	^ 600 @ 400
]

{ #category : #initialization }
CMSpecModelComments >> initializePresenter [
	" Private - See superimplementor's comment "
	
	self versionName
		label: self translator tVersionName;
		ghostText: '1.0'.
	self creationDate 
		label: self translator tCreationDate;
		ghostText: Date today asString.
	self modelText
		label: self translator tModelComments.
	self toolbar 
"		firstButtonLabel: 'Cancel';
		firstButtonAction: [ self delete ];"
		firstButtonLabel: 'Ok';
		firstButtonAction: [ 
			self addModelComments.
			self delete ]
]

{ #category : #initialization }
CMSpecModelComments >> initializeWidgets [
	" Private - See superimplementor's comment "
	
	self instantiateModels: #(
		versionName 			SpcLabeledTextField
		creationDate 		SpcLabeledTextField
		authorList 			CMGrowableAuthorList
		modelText 			SpcLabeledTextArea
		toolbar 				SpcOneButtonToolbar
		).
	self focusOrder 
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

	^ 'Model Comments'
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
