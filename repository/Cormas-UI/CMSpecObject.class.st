Class {
	#name : #CMSpecObject,
	#superclass : #ComposablePresenter,
	#instVars : [
		'projectManager'
	],
	#category : #'Cormas-UI-Core'
}

{ #category : #examples }
CMSpecObject class >> example [

	^ self basicNew 
		projectManager: (CMProjectManager new projectWindow: self);
		translator: (CMTranslator newForLanguage: #EN);
		initialize;
		openWithSpec
]

{ #category : #'instance creation' }
CMSpecObject class >> for: aCMProjectManager [ 
	" Answer a new instance of the receiver using aCMProjectManager as model "
	
	^ self basicNew 
		projectManager: aCMProjectManager;
		initialize;
		yourself
]

{ #category : #'instance creation' }
CMSpecObject class >> openFor: aCMProjectManager [ 
	" Create and open a new instance of the receiver, configuring its controller with aCMProjectManager"

	^ (self for: aCMProjectManager)
		openWithSpec;
		centered;
		yourself
]

{ #category : #'instance creation' }
CMSpecObject class >> openModalFor: aCMProjectManager [ 

	^ (self for: aCMProjectManager)
		initialize;
		openDialogWithSpec;
		centered;
		yourself
]

{ #category : #'instance creation' }
CMSpecObject class >> owner: owner [
	" Answer a new instance of the receiver configuring project settings "
	
	^ self basicNew
		owner: owner;
		projectManager: owner projectManager;
		initialize;
		yourself.
]

{ #category : #accessing }
CMSpecObject >> alertNameAlreadyExist [
	" Raise an alert modal message "

	^ self alertMessage: self translator tAlreadyUsed
]

{ #category : #accessing }
CMSpecObject >> cormas [
	" Answer a CMProjectModel "
	
	^ self projectManager cormasModel
]

{ #category : #accessing }
CMSpecObject >> cormasModel [
	" Answer a CMProjectModel "
	
	^ self projectManager cormasModel
]

{ #category : #accessing }
CMSpecObject >> cormasModelClass [
	" Answer a CMProjectModel class "
	
	^ self projectManager cormasModelClass
]

{ #category : #accessing }
CMSpecObject >> currentProject [ 

	^ self projectManager currentProject 
]

{ #category : #accessing }
CMSpecObject >> iconNamed: aSymbol [
	" Answer a <Form> representing a Cormas icon "

	^ CMIcons perform: aSymbol
]

{ #category : #callbacks }
CMSpecObject >> openHelp [
	self shouldBeImplemented.
]

{ #category : #accessing }
CMSpecObject >> projectAnnouncer [

	^ self projectManager announcer 
]

{ #category : #accessing }
CMSpecObject >> projectManager [
	^ projectManager
]

{ #category : #accessing }
CMSpecObject >> projectManager: aCMProjectManager [
	" Set the receiver's project "

	projectManager := aCMProjectManager
]

{ #category : #accessing }
CMSpecObject >> translator [
	" Answer the project <PFTranslator> "

	^ self projectManager translator
]

{ #category : #accessing }
CMSpecObject >> translator: aPFTranslator [
	" Answer the project <PFTranslator> "

	^ self projectManager translator: aPFTranslator
]
