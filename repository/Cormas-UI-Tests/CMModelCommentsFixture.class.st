Class {
	#name : #CMModelCommentsFixture,
	#superclass : #Object,
	#instVars : [
		'version',
		'creationDate',
		'authors',
		'authorsString',
		'comment',
		'cormasModel',
		'projectModel',
		'projectManager'
	],
	#category : #'Cormas-UI-Tests-Core'
}

{ #category : #accessing }
CMModelCommentsFixture >> authors [

	^ authors
]

{ #category : #accessing }
CMModelCommentsFixture >> authors: anObject [

	authors := anObject
]

{ #category : #accessing }
CMModelCommentsFixture >> authorsString [

	^ authorsString
]

{ #category : #accessing }
CMModelCommentsFixture >> comment [

	^ comment
]

{ #category : #accessing }
CMModelCommentsFixture >> cormasModel [

	^ cormasModel
]

{ #category : #accessing }
CMModelCommentsFixture >> creationDate [

	^ creationDate
]

{ #category : #initialization }
CMModelCommentsFixture >> initialize [

	super initialize.
	
	version := 'v3.0'.
	creationDate := '24 August 1991'.
	
	authors := #(
		('Jon Doe' 'jon.doe@gmail.com')
		('Jane Doe' 'jane.doe@hotmail.com')).
		
	authorsString := 'Jon Doe;jon.doe@gmail.com
Jane Doe;jane.doe@hotmail.com'.

	comment := 'Lorem ipsum dolor sit amet'.

	cormasModel := CMMockModel new.
	
	projectModel := CMProjectModel for: cormasModel.
	
	projectManager := CMProjectManager new
		currentProject: projectModel;
		yourself.
]

{ #category : #accessing }
CMModelCommentsFixture >> projectManager [

	^ projectManager
]

{ #category : #accessing }
CMModelCommentsFixture >> projectModel [

	^ projectModel
]

{ #category : #accessing }
CMModelCommentsFixture >> version [

	^ version
]
