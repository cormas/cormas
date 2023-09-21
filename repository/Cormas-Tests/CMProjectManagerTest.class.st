Class {
	#name : #CMProjectManagerTest,
	#superclass : #CMAbstractModelTest,
	#instVars : [
		'projectManager'
	],
	#category : #'Cormas-Tests-Project'
}

{ #category : #accessing }
CMProjectManagerTest >> projectManager [
	^ projectManager
]

{ #category : #accessing }
CMProjectManagerTest >> projectManager: anObject [
	projectManager := anObject
]

{ #category : #test }
CMProjectManagerTest >> projectModel [

	^ self projectManager currentProject 
]

{ #category : #'tests-accessing-entities' }
CMProjectManagerTest >> setUp [ 

	super setUp.
	CMApplication release.
	PFProjectSettings currentApplicationClass: CMApplication.
	model := self newTestModel.
	projectManager := self newProjectManager.
]

{ #category : #test }
CMProjectManagerTest >> testApplicationExtension [

	self assert: (self projectManager applicationExtension isKindOf: String).
	self assert: self projectManager applicationExtension equals: CMGitBridge applicationExtension.
]

{ #category : #test }
CMProjectManagerTest >> testCodeGenerator [

	self assert: (self projectManager codeGenerator isKindOf: CGStCormas)
]

{ #category : #test }
CMProjectManagerTest >> testCormasModel [

	self assert: (self projectManager cormasModel isKindOf: CMAbstractModel).
	self projectManager cormasModel: nil.
	self assert: self projectManager cormasModel isNil.
]

{ #category : #test }
CMProjectManagerTest >> testCormasModelAuthors [

	self projectManager cormasModelAuthors: 'author1;author@cormas.org'.
	self assert: self projectManager cormasModelAuthors equals: 'author1;author@cormas.org'.
]

{ #category : #test }
CMProjectManagerTest >> testCormasModelClass [

	self assert: (self projectManager cormasModelClass isKindOf: CMAbstractModel class).

]

{ #category : #test }
CMProjectManagerTest >> testCormasModelComment [

	| modelComment |
	
	self assert: self projectManager cormasModelComment isNil.
	modelComment := 'This is a model comment'.
	self projectManager cormasModelComment: modelComment.
	self assert: self projectManager cormasModelComment equals: modelComment.
]

{ #category : #test }
CMProjectManagerTest >> testCormasModelName [

	self assert: self projectManager cormasModelName equals: 'CMMockModel'
]

{ #category : #test }
CMProjectManagerTest >> testCormasModelVersion [

	| modelVersion |
	
	modelVersion := '1.0'.
	self projectModel cormasModelVersion: modelVersion.
	self assert: (self projectManager cormasModelClass respondsTo: #cmVersion).
	self assert: self projectManager cormasModelClass cmVersion equals: modelVersion.
]

{ #category : #test }
CMProjectManagerTest >> testCreateClassModelNamed [

	| modelClassname |
	
	modelClassname := self sampleModelName.
	self assert: ((self projectManager createClassModelNamed: modelClassname) isKindOf: Class).
	self assert: (self class environment hasClassNamed: modelClassname).
]

{ #category : #test }
CMProjectManagerTest >> testCurrentProjectHasAuthor [

	self projectManager cormasModelAuthors: 'author_name'.
	self assert: self projectManager currentProjectHasAuthor.

]

{ #category : #test }
CMProjectManagerTest >> testCurrentProjectHasVersion [

	self projectManager cormasModelVersion: '1.0'.
	self assert: self projectManager currentProjectHasVersion.

]

{ #category : #test }
CMProjectManagerTest >> testCurrentProjectVersion [

	self projectManager cormasModelVersion: '1.0'.
	self assert: self projectManager currentProjectVersion equals: '1.0'.

]

{ #category : #test }
CMProjectManagerTest >> testGitBridge [

	self assert: (self projectManager gitBridge isKindOf: CMGitBridge)
]

{ #category : #test }
CMProjectManagerTest >> testIsValidCormasEntityName [

	| entityName |

	entityName := 'Entity1'.
	self assert: (self projectManager isValidCormasEntityName: entityName).
	self newValidEntityNamed: entityName.
	self deny: (self projectManager isValidCormasEntityName: entityName).
	(self class environment at: (entityName asValidCormasClassName: self sampleModelNameWithoutPrefix)) removeFromSystem
]

{ #category : #tests }
CMProjectManagerTest >> testIsValidProjectName [

	self deny: (self projectManager isValidProjectName: nil).
	self deny: (self projectManager isValidProjectName: '').
	self deny: (self projectManager isValidProjectName: '.').
	self deny: (self projectManager isValidProjectName: '').
	self deny: (self projectManager isValidProjectName: ' ').
	self deny: (self projectManager isValidProjectName: '  ').
	self deny: (self projectManager isValidProjectName: 'Project Name').
	self deny: (self projectManager isValidProjectName: '_').
	self deny: (self projectManager isValidProjectName: '\').
	self deny: (self projectManager isValidProjectName: '''').
	self deny: (self projectManager isValidProjectName: '33').
	
	self assert: (self projectManager isValidProjectName: 'ValidName').
]

{ #category : #test }
CMProjectManagerTest >> testModelControlInitMethods [

	self assert: (self projectManager modelControlInitMethods isKindOf: Array).
	self assert: self projectManager modelControlInitMethods isEmpty.
]

{ #category : #test }
CMProjectManagerTest >> testModelInitMethods [

	self assert: (self projectManager modelInitMethods isKindOf: Array).
	self assert: self projectManager modelInitMethods size equals: 5.
]

{ #category : #test }
CMProjectManagerTest >> testModelProbesMethods [

	self assert: (self projectManager modelProbesMethods isKindOf: Array).
	self assertCollection: self projectManager modelProbesMethods hasSameElements: #('Global>>numberOfDeadAgents' 'Global>>numberOfAliveAgents').
]

{ #category : #test }
CMProjectManagerTest >> testProjectClass [

	self assert: self projectManager projectClass equals: CMProjectModel
]

{ #category : #test }
CMProjectManagerTest >> testTranslator [

	self assert: (projectManager translator isKindOf: CMAbstractTranslator)
]
