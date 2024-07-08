"
Accessing application:

CMSpecApplicationProject uniqueInstance.

Release and re-initialize application:

CMApplicationProject release.
CMApplicationProject currentProjectName.

Create user directories:

CMApplicationProject createUserDirectories.
CMApplicationProject removeUserDirectories.
"
Class {
	#name : #CMApplication,
	#superclass : #Object,
	#instVars : [
		'gitBridge',
		'currentProject',
		'projectClass'
	],
	#classVars : [
		'AppSingleton'
	],
	#category : #'Cormas-Core-Project'
}

{ #category : #accessing }
CMApplication class >> applicationName [
	" Answer a <String> with receiver's name "
	
	^ 'CORMAS Application'
]

{ #category : #initialization }
CMApplication class >> initializeApplication [
	" Set the class' initial state "
	
	AppSingleton := self new.
]

{ #category : #initialization }
CMApplication class >> release [
	" Prepare the class to be deleted "
	
	AppSingleton := nil.
]

{ #category : #accessing }
CMApplication class >> uniqueInstance [
	" Answer the class' primary instance "
	
	^ AppSingleton
		ifNil: [ 
			self initializeApplication.
			AppSingleton ]	
]

{ #category : #accessing }
CMApplication >> cormasModel [
	" Answer the receiver's current project model, a <CMAbstractModel> instance "

	^ self currentProject cormasModel 
]

{ #category : #accessing }
CMApplication >> createProjectNamed: aNameString [
	" Set a new project named aNameString, setting its user to the default user. Answer a <PFProjectBase> "

	self currentProject: (self projectClass 
		named: aNameString 
		author: (PFProjectUser named: self defaultUsername)).
	^ self currentProject

]

{ #category : #accessing }
CMApplication >> currentProject [

	^ currentProject
]

{ #category : #accessing }
CMApplication >> currentProject: anObject [

	currentProject := anObject
]

{ #category : #accessing }
CMApplication >> defaultProjectClass [
	" Private - See superimplementor's comment "

	^ CMProjectModel
]

{ #category : #accessing }
CMApplication >> defaultUsername [

	^ 'Unknown'
]

{ #category : #accessing }
CMApplication >> gitBridge [

	^ gitBridge
]

{ #category : #initialization }
CMApplication >> initialize [

	super initialize.
	projectClass := CMProjectModel.
	gitBridge := CMGitBridge new.
]

{ #category : #accessing }
CMApplication >> modelNames [
	" Answer a <Collection> of <String> with receiver's available models "
	
	^ self gitBridge modelNames
]

{ #category : #accessing }
CMApplication >> projectClass [

	^ projectClass
]

{ #category : #accessing }
CMApplication >> projectClass: aClass [
	" Associate receiver's (an application) with a project aClass "

	projectClass := aClass
]

{ #category : #callbacks }
CMApplication >> releaseProject [
	" Release the receiver's current project. "

	self currentProject: nil.
	self projectClass: nil
]
