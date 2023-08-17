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
	#name : #CMApplicationProject,
	#superclass : #PFProjectApplication,
	#instVars : [
		'gitBridge'
	],
	#category : #'Cormas-Core-Project'
}

{ #category : #accessing }
CMApplicationProject class >> applicationName [
	" Answer a <String> with receiver's name "
	
	^ 'CORMAS Application'
]

{ #category : #initialization }
CMApplicationProject class >> initializeApplication [
	" Set the class' initial state "
	
	AppSingleton := self new.
]

{ #category : #initialization }
CMApplicationProject class >> release [
	" Prepare the class to be deleted "
	
	AppSingleton := nil.
]

{ #category : #accessing }
CMApplicationProject class >> uniqueInstance [
	" Answer the class' primary instance "
	
	^ AppSingleton
		ifNil: [ 
			self initializeApplication.
			AppSingleton ]	
]

{ #category : #accessing }
CMApplicationProject >> cormasModel [
	" Answer the receiver's current project model, a <CMAbstractModel> instance "

	^ self currentProject cormasModel 
]

{ #category : #accessing }
CMApplicationProject >> createProjectNamed: aNameString [
	" Set a new project named aNameString, setting its user to the default user. Answer a <PFProjectBase> "

	self currentProject: (self projectClass 
		named: aNameString 
		author: (PFProjectUser named: self defaultUsername)).
	^ self currentProject

]

{ #category : #accessing }
CMApplicationProject >> currentProject [

	^ currentProject
]

{ #category : #accessing }
CMApplicationProject >> currentProject: anObject [

	currentProject := anObject
]

{ #category : #accessing }
CMApplicationProject >> defaultProjectClass [
	" Private - See superimplementor's comment "

	^ CMProjectModel
]

{ #category : #accessing }
CMApplicationProject >> defaultUsername [

	^ 'Unknown'
]

{ #category : #accessing }
CMApplicationProject >> gitBridge [

	^ gitBridge
]

{ #category : #initialization }
CMApplicationProject >> initialize [

	super initialize.
	translator := CMEnglishTranslator new.
	projectClass := CMProjectModel.
	gitBridge := CMGitBridge new.
]

{ #category : #accessing }
CMApplicationProject >> modelNames [
	" Answer a <Collection> of <String> with receiver's available models "
	
	^ self gitBridge modelNames
]

{ #category : #accessing }
CMApplicationProject >> projectClass [

	^ projectClass
]

{ #category : #accessing }
CMApplicationProject >> projectClass: aClass [
	" Associate receiver's (an application) with a project aClass "

	projectClass := aClass
]

{ #category : #callbacks }
CMApplicationProject >> releaseProject [
	" Release the receiver's current project. "

	self currentProject: nil.
	self projectClass: nil
]

{ #category : #accessing }
CMApplicationProject >> translator [

	^ translator
]

{ #category : #accessing }
CMApplicationProject >> translator: anObject [

	translator := anObject
]
