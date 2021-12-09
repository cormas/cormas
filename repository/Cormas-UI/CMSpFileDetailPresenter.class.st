Class {
	#name : #CMSpFileDetailPresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'notebook',
		'selectedFile',
		'page'
	],
	#category : #'Cormas-UI-Spec2-ProjectBrowser'
}

{ #category : #specs }
CMSpFileDetailPresenter class >> defaultSpec [

	^ SpBoxLayout newHorizontal	 
		add: #notebook;
		yourself
]

{ #category : #specs }
CMSpFileDetailPresenter class >> open [ 
	<script>
	(self new)
		openWithSpec 
]

{ #category : #initialization }
CMSpFileDetailPresenter >> detailText [

	^self newText
		text: self fileContents;
		yourself
]

{ #category : #initialization }
CMSpFileDetailPresenter >> fileContents [ 

	^selectedFile asFileReference binaryReadStreamDo: [:stream |
		(ZnCharacterReadStream on: stream encoding: #null) next: 5000 ]
]

{ #category : #initialization }
CMSpFileDetailPresenter >> fileContentsPage [
	^ SpNotebookPage
		title: 'Preview ' , selectedFile label 
		icon: HRBIconCache fileIcon
		provider: self detailText 
		 
]

{ #category : #accessing }
CMSpFileDetailPresenter >> hidePage [

	page ifNotNil: [ 
			notebook removePage: page.
			page := nil ]
]

{ #category : #initialization }
CMSpFileDetailPresenter >> initializePresenters [
	
	notebook := self newNotebook
	
]

{ #category : #accessing }
CMSpFileDetailPresenter >> selectedFile [
	^ selectedFile
]

{ #category : #accessing }
CMSpFileDetailPresenter >> selectedFile: anObject [
	selectedFile := anObject
]

{ #category : #accessing }
CMSpFileDetailPresenter >> showFile: anObject [
	self hidePage.
	selectedFile := anObject.		
	anObject isNil ifTrue: [ ^self ].		
	anObject isFile ifFalse: [ ^self ]. 
	
	page := self fileContentsPage.
	notebook addPage: page.
	notebook selectPage: page.

			
]
