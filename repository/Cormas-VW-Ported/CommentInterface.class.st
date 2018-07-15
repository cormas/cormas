"
CommentInterface is an interface to add some Comments to Cormas versions or to Model versions.

Instance Variables:
	authorMailList	<SelectionInList>	description of authorMailList
	authorName	<ValueHolder>	description of authorName
	cormasComments	<ValueHolder>	description of cormasComments
	creationDate	<ValueHolder>	description of creationDate
	modelComments	<ValueHolder>	description of modelComments
	modelName	<ValueHolder>	description of modelName
	newComments	<ValueHolder>	description of newComments
	previousComments	<ValueHolder>	description of previousComments
	selectedRow	<ValueModel>	description of selectedRow


"
Class {
	#name : #CommentInterface,
	#superclass : #Object,
	#instVars : [
		'modelName',
		'creationDate',
		'modelComments',
		'authorMailList',
		'selectedRow',
		'authorName',
		'cormasComments',
		'previousComments',
		'newComments'
	],
	#category : 'Cormas-VW-Ported'
}

{ #category : #'interface specs' }
CommentInterface class >> commentsCormasWindow [
	"Tools.UIPainter new openOnClass: self andSelector: #commentsCormasWindow"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Cormas Version Comments' 
			#min: #(Point 651 411) 
			#max: #(Point 651 411) 
			#bounds: #(Rectangle 719 449 1370 860) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 8191 8191 6479)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(LabelSpec 
				#layout: #(Point 9 10) 
				#name: #Label3 
				#label: 'Cormas Versions' 
				#style: #large) #(ActionButtonSpec 
				#layout: #(Rectangle 303 371 375 397) 
				#name: #CormasVersionOk 
				#isOpaque: true 
				#model: #closeRequest 
				#label: 'OK' 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(Rectangle 339 12 502 35) 
				#name: #InputField1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #authorName 
				#isReadOnly: false) #(TextEditorSpec 
				#layout: #(Rectangle 15 82 633 362) 
				#name: #TextEditor3 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #cormasComments 
				#helpText: 'Write here the comments and purpose of this new version of Cormas' 
				#tabRequiresControl: true) #(LabelSpec 
				#layout: #(Point 223 15) 
				#name: #DeveloperName 
				#label: 'Developer''s Name') #(LabelSpec 
				#layout: #(Point 16 57) 
				#name: #Label1 
				#label: 'Some comments on this Cormas version'))))
]

{ #category : #'interface specs' }
CommentInterface class >> commentsModelWindow [
	"Tools.UIPainter new openOnClass: self andSelector: #commentsModelWindow"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Model Version Comments' 
			#min: #(Point 651 411) 
			#max: #(Point 651 411) 
			#bounds: #(Rectangle 720 450 1364 861) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 8191 8191 6479)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(LabelSpec 
				#layout: #(Point 15 6) 
				#name: #Label3 
				#label: 'Model Versions' 
				#style: #large) #(ActionButtonSpec 
				#layout: #(Rectangle 213 383 316 409) 
				#name: #CormasVersionOk 
				#isOpaque: true 
				#model: #closeAccept 
				#label: 'Add comments' 
				#defaultable: true) #(InputFieldSpec 
				#layout: #(Rectangle 345 6.5 508 29.5) 
				#name: #InputField1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #authorName 
				#isReadOnly: false) #(TextEditorSpec 
				#layout: #(Rectangle 15 214 632 379) 
				#name: #TextEditor3 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue #white)) 
				#model: #newComments 
				#helpText: 'Write here the comments and purpose of this new version of Cormas' 
				#tabRequiresControl: true) #(LabelSpec 
				#layout: #(Point 229 9) 
				#name: #DeveloperName 
				#label: 'Developer''s Name') #(LabelSpec 
				#layout: #(Point 16 35) 
				#name: #Label1 
				#label: 'Previous versions'' comments') #(ActionButtonSpec 
				#layout: #(Rectangle 355 383 458 409) 
				#name: #ActionButton2 
				#model: #closeCancel 
				#label: 'No comment' 
				#defaultable: true) #(TextEditorSpec 
				#layout: #(Rectangle 15 52 632 192) 
				#name: #TextEditor1 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 7044 7044 7044)) 
				#model: #previousComments 
				#tabRequiresControl: true) #(LabelSpec 
				#layout: #(Point 16 196) 
				#name: #Label2 
				#label: 'Some comments on this version'))))
]

{ #category : #'interface specs' }
CommentInterface class >> commentsWindow [
	"Tools.UIPainter new openOnClass: self andSelector: #commentsWindow"
	
	<resource: #canvas>
	^#(FullSpec 
		#window: #(WindowSpec 
			#label: 'Model Comments' 
			#min: #(Point 651 411) 
			#max: #(Point 651 411) 
			#bounds: #(Rectangle 373 357 1024 768) 
			#colors: #(LookPreferences 
				#setBackgroundColor: #(ColorValue 8191 8191 6479)) 
			#isEventDriven: true) 
		#component: #(SpecCollection 
			#collection: #(#(InputFieldSpec 
				#layout: #(Rectangle 503 16 630 39) 
				#name: #creationDate 
				#model: #creationDate) #(LabelSpec 
				#layout: #(Point 9 10) 
				#name: #Label3 
				#label: 'Version' 
				#style: #large) #(ActionButtonSpec 
				#layout: #(Rectangle 303 371 375 397) 
				#name: #ok 
				#isOpaque: true 
				#model: #closeRequest 
				#label: 'OK' 
				#defaultable: true) #(LabelSpec 
				#layout: #(Point 419 17) 
				#name: #Label4 
				#label: #(UserMessage 
					#key: #creationDate 
					#defaultString: 'creation date')) #(LabelSpec 
				#layout: #(Point 9 46) 
				#name: #Label5 
				#label: #(UserMessage 
					#key: #authors 
					#defaultString: 'Authors') 
				#style: #large) #(LabelSpec 
				#layout: #(Point 97 17) 
				#name: #Label1 
				#label: #(UserMessage 
					#key: #name 
					#defaultString: 'Name')) #(InputFieldSpec 
				#layout: #(Rectangle 132 16 232 39) 
				#name: #InputField1 
				#isOpaque: true 
				#colors: #(LookPreferences 
					#setBackgroundColor: #(ColorValue 6553 6553 6553)) 
				#model: #modelName 
				#isReadOnly: true) #(LabelSpec 
				#layout: #(Point 9 167) 
				#name: #Label7 
				#label: #(UserMessage 
					#key: #modelComments 
					#defaultString: 'Model comments') 
				#style: #large) #(TextEditorSpec 
				#layout: #(Rectangle 95 199 633 362) 
				#name: #TextEditor3 
				#model: #modelComments 
				#helpText: 'Write here the comments and purpose of the model' 
				#tabRequiresControl: true) #(DataSetSpec 
				#properties: #(PropertyListDictionary #showHorizontalLines true #allowColumnResizing true #showVerticalLines true #allowColumnReordering false) 
				#layout: #(Rectangle 96 55 631 165) 
				#name: #Dataset1 
				#model: #authorMailList 
				#columns: #(#(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #labelFromApplication false #allowSorting false #allowResizing true) 
					#model: #'selectedRow name' 
					#label: #(UserMessage 
						#key: #name 
						#defaultString: 'Name') 
					#labelIsImage: false 
					#width: 200 
					#editorType: #InputField 
					#noScroll: false 
					#labelsAsButtons: true) #(DataSetColumnSpec 
					#properties: #(PropertyListDictionary #allowSorting false #labelFromApplication false) 
					#model: #'selectedRow email' 
					#label: 'e-mail' 
					#labelIsImage: false 
					#width: 315 
					#editorType: #InputField 
					#noScroll: false 
					#labelsAsButtons: true)) 
				#labelsAsButtons: true) #(ActionButtonSpec 
				#layout: #(Rectangle 10 139 85 163) 
				#name: #ActionButton1 
				#model: #addRow 
				#label: #(UserMessage 
					#key: #addRow 
					#defaultString: 'Add Row') 
				#defaultable: true))))
]

{ #category : #finalizing }
CommentInterface class >> finalizationRegistry [
	" *** This method was defined by Object as a subclass responsibility.
	Replace its body with a proper implementation. *** "
	
	self error: 'Subclass responsibility stub not reimplemented'
]

{ #category : #finalizing }
CommentInterface class >> notifyWhenFinalizable: anObject [
	" *** This method was defined by Object as a subclass responsibility.
	Replace its body with a proper implementation. *** "
	
	self error: 'Subclass responsibility stub not reimplemented'
]

{ #category : #actions }
CommentInterface >> addRow [
	
	authorMailList list add: CMAuthor new.
	^self
]

{ #category : #aspects }
CommentInterface >> authorMailList [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^authorMailList isNil
		ifTrue:
			[authorMailList := SelectionInList new.
			authorMailList selectionIndexHolder
				compute: [:v | self selectedRow value: authorMailList selection].
			authorMailList]
		ifFalse: [authorMailList]
]

{ #category : #accessing }
CommentInterface >> authorName [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^authorName isNil
		ifTrue: [authorName := String new asValue]
		ifFalse: [authorName]
]

{ #category : #accessing }
CommentInterface >> authorName: anObject [
	
	authorName := anObject
]

{ #category : #asList }
CommentInterface >> authorsAsList [
	
	^Cormas textAsList: self authorList value
]

{ #category : #actions }
CommentInterface >> closeAccept [
	"Allow the window to close if requestForWindowClose 
	answers true."
	
	self accept setValue: true.
	self cancel setValue: false.
	self close
]

{ #category : #actions }
CommentInterface >> closeCancel [
	"Allow the window to close.  Do not send requestForWindowClose."
	
	self accept setValue: false.
	self cancel setValue: true.
	self close
]

{ #category : #'interface closing' }
CommentInterface >> closeRequest [
	
	super closeRequest
]

{ #category : #accessing }
CommentInterface >> cormasComments [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^cormasComments isNil
		ifTrue: [cormasComments := String new asValue]
		ifFalse: [cormasComments]
]

{ #category : #accessing }
CommentInterface >> cormasComments: anObject [
	
	cormasComments := anObject
]

{ #category : #aspects }
CommentInterface >> creationDate [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^creationDate isNil
		ifTrue: [creationDate := String new asValue]
		ifFalse: [creationDate]
]

{ #category : #finalizing }
CommentInterface >> finalizationRegistry [
	" *** This method was defined by Object as a subclass responsibility.
	Replace its body with a proper implementation. *** "
	
	self error: 'Subclass responsibility stub not reimplemented'
]

{ #category : #'initialize-release' }
CommentInterface >> initOn: aModelClass [
	"modelName creationDate eMailList authorList modelComments"
	
	modelName := aModelClass name asString asValue.
	aModelClass creationDate = ' '
		ifTrue: [creationDate := Date today printString asValue]
		ifFalse: [creationDate := aModelClass creationDate asValue].
	aModelClass getAuthors
		do: [:author | self authorMailList list add: author].
	aModelClass comments = 'Not yet commented...'
		ifFalse: [modelComments := aModelClass comments asValue]
]

{ #category : #'initialize-release' }
CommentInterface >> initialize [
	"Initialize a newly created instance. This method must answer the receiver."
	
	self authorMailList list: List new.
	super initialize.
	^self
]

{ #category : #asList }
CommentInterface >> mailAsList [
	
	^Cormas textAsList: self eMailList value
]

{ #category : #accessing }
CommentInterface >> modelComments [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^modelComments isNil
		ifTrue: [modelComments := String new asValue]
		ifFalse: [modelComments]
]

{ #category : #aspects }
CommentInterface >> modelName [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^modelName isNil
		ifTrue: [modelName := String new asValue]
		ifFalse: [modelName]
]

{ #category : #accessing }
CommentInterface >> newComments [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^newComments isNil
		ifTrue: [newComments := String new asValue]
		ifFalse: [newComments]
]

{ #category : #finalizing }
CommentInterface >> notifyWhenFinalizable: anObject [
	" *** This method was defined by Object as a subclass responsibility.
	Replace its body with a proper implementation. *** "
	
	self error: 'Subclass responsibility stub not reimplemented'
]

{ #category : #accessing }
CommentInterface >> previousComments [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^previousComments isNil
		ifTrue: [previousComments := String new asValue]
		ifFalse: [previousComments]
]

{ #category : #aspects }
CommentInterface >> selectedRow [
	"This method was generated by UIDefiner.  Any edits made here
	may be lost whenever methods are automatically defined.  The
	initialization provided below may have been preempted by an
	initialize method."
	
	^selectedRow isNil
		ifTrue: [selectedRow := nil asValue]
		ifFalse: [selectedRow]
]
