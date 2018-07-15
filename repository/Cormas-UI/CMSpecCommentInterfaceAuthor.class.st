"
Represents each ""row"" with author information in Model Comments window.

| m |
m := DynamicComposableModel new.
m instantiateModels: #(item CMSpecCommentInterfaceAuth  ok OkToolbar).
m ok okAction: [ m window delete ].
m openWithSpecLayout: (SpecLayout composed
	newColumn: [: c | 
		c add: #item ;
			add: #ok height: 26 ];
	yourself).
	
CMSpecCommentInterfaceAuthor new openWithSpec.
"
Class {
	#name : #CMSpecCommentInterfaceAuthor,
	#superclass : #SpcDynamicGrowableBox,
	#instVars : [
		'validated',
		'conditionValue',
		'authorName',
		'authorEmail'
	],
	#category : 'Cormas-UI-Core'
}

{ #category : #specs }
CMSpecCommentInterfaceAuthor class >> spec [
	<spec>
	
	^ SpecLayout composed newRow: [: r |
			r
				add: #authorName;
				add: #authorEmail;
				add: #ok width: 35 ]
			height: 25;
		yourself
]

{ #category : #initialization }
CMSpecCommentInterfaceAuthor >> initializeAuthorEmail [

	self authorEmail
		ghostText: 'e-mail';
		entryCompletion: nil;
		autoAccept: true;
		acceptBlock: validateBlock;
		whenTextChanged: [ : t | 
			t isEmpty 
				ifTrue: [ self beInvalid ]
				ifFalse: [ self beValid ] ].
]

{ #category : #initialization }
CMSpecCommentInterfaceAuthor >> initializeAuthorName [

	self authorName
		ghostText: 'Name';
		entryCompletion: nil;
		autoAccept: true;
		acceptBlock: validateBlock;
		whenTextChanged: [ : t | 
			t isEmpty 
				ifTrue: [ self beInvalid ]
				ifFalse: [ self beValid ] ].
]

{ #category : #initialization }
CMSpecCommentInterfaceAuthor >> initializeBoxModels [

	self instantiateModels: #(
		authorName 			#TextInputFieldModel 
		authorEmail 			#TextInputFieldModel 
		ok 						#ButtonModel).
]

{ #category : #initialization }
CMSpecCommentInterfaceAuthor >> initializeWidgets [
	" Private - See superimplementor's comment "

	self initializeBoxModels.
	validateBlock := [ :t | self ok enabled: t isEmpty not ].
	self initializeAuthorName.
	self initializeAuthorEmail.	
	self initializeAddButton.
	self focusOrder
		add: self authorName;
		add: self authorEmail;
		add: self ok
]
