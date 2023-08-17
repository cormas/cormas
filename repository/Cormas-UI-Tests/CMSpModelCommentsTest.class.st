Class {
	#name : #CMSpModelCommentsTest,
	#superclass : #TestCase,
	#instVars : [
		'presenter',
		'fixture'
	],
	#category : #'Cormas-UI-Tests'
}

{ #category : #initialization }
CMSpModelCommentsTest >> setUp [ 
	
	super setUp.
	fixture := CMModelCommentsFixture new.
	presenter := CMSpModelComments for: fixture cormasModel.
]

{ #category : #tests }
CMSpModelCommentsTest >> testAuthorsAreSaved [
	
	presenter authorsTable items: fixture authors.
	presenter okButton click.
	
	self
		assert: fixture cormasModel authors
		equals: fixture authorsString.
]

{ #category : #tests }
CMSpModelCommentsTest >> testAuthorsTableAsString [

	presenter authorsTable items: fixture authors.
	
	self
		assert: presenter authorsTableAsString
		equals: fixture authorsString.
]

{ #category : #tests }
CMSpModelCommentsTest >> testCommentIsSaved [
	
	presenter modelCommentText text: fixture comment.
	presenter okButton click.
	
	self
		assert: fixture cormasModel comment
		equals: fixture comment.
]

{ #category : #tests }
CMSpModelCommentsTest >> testCreationDateIsSaved [
	
	presenter creationDate text: fixture creationDate.
	presenter okButton click.
	
	self
		assert: fixture cormasModel creationDate
		equals: fixture creationDate.
]

{ #category : #tests }
CMSpModelCommentsTest >> testVersionIsSaved [
	
	presenter versionName text: fixture version.
	presenter okButton click.
	
	self
		assert: fixture cormasModel version
		equals: fixture version.
]
