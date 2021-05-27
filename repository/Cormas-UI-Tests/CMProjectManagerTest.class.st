Class {
	#name : #CMProjectManagerTest,
	#superclass : #CMAbstractModelTest,
	#instVars : [
		'projectManager'
	],
	#category : #'Cormas-UI-Tests-Project'
}

{ #category : #test }
CMProjectManagerTest >> newValidEntityNamed: entityName [

	CMSpatialEntityAggregate subclass: (entityName asValidCormasClassName: self sampleModelNameWithoutPrefix)
]

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
	CMApplicationProject release.
	PFProjectSettings currentApplicationClass: CMApplicationProject.
	model := self newTestModel.
	projectManager := self newProjectManager.
]

{ #category : #test }
CMProjectManagerTest >> testApplicationExtension [

	self assert: (self projectManager applicationExtension isKindOf: String).
	self assert: self projectManager applicationExtension equals: CMApplicationProject applicationExtension.
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
CMProjectManagerTest >> testCormasModelCreationDate [

	| modelDate |
	
	modelDate := Date today asString.
	self projectModel cormasModelCreationDate: modelDate.
	self assert: (self projectManager cormasModelClass respondsTo: #creationDate).
	self assert: self projectManager cormasModelClass creationDate equals: modelDate.
]

{ #category : #test }
CMProjectManagerTest >> testCormasModelName [

	self assert: self projectManager cormasModelName equals: 'CMTestModel'
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
CMProjectManagerTest >> testCormasModels [

	self assertCollection: self projectManager cormasModels hasSameElements: self cormasModelNamesForTests.
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
CMProjectManagerTest >> testCurrentProjectHasComments [

	self projectManager cormasModelComment: 'comment 1'.
	self assert: self projectManager currentProjectHasComments.

]

{ #category : #test }
CMProjectManagerTest >> testCurrentProjectHasCreationDate [

	self projectManager cormasModelCreationDate: Date today asString.
	self assert: self projectManager currentProjectHasCreationDate.

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
CMProjectManagerTest >> testIsValidCormasEntityName [

	| entityName |

	entityName := 'Entity1'.
	self assert: (self projectManager isValidCormasEntityName: entityName).
	self newValidEntityNamed: entityName.
	self deny: (self projectManager isValidCormasEntityName: entityName).
	(self class environment at: (entityName asValidCormasClassName: self sampleModelNameWithoutPrefix)) removeFromSystem
]

{ #category : #test }
CMProjectManagerTest >> testModelControlInitMethods [

	self assert: (self projectManager modelControlInitMethods isKindOf: Array).
	self assert: self projectManager modelControlInitMethods isEmpty.
]

{ #category : #test }
CMProjectManagerTest >> testModelInitMethods [

	self assert: (self projectManager modelInitMethods isKindOf: Array).
	self assert: self projectManager modelInitMethods isEmpty.
]

{ #category : #test }
CMProjectManagerTest >> testModelProbesMethods [

	self assert: (self projectManager modelProbesMethods isKindOf: Array).
	self assertCollection: self projectManager modelProbesMethods hasSameElements: #('Global>>numDeads' 'Global>>numAlives').
]

{ #category : #test }
CMProjectManagerTest >> testProjectClass [

	self assert: self projectManager projectClass equals: CMProjectModel
]

{ #category : #test }
CMProjectManagerTest >> testResourceLocator [

	self assert: (self projectManager resourceLocator isKindOf: CMResourceLocator)
]
