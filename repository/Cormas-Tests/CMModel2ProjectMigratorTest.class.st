"
A CMModel2ProjectMigratorTest is a test class for testing the behavior of CMModel2ProjectMigrator
"
Class {
	#name : #CMModel2ProjectMigratorTest,
	#superclass : #TestCase,
	#instVars : [
		'migrator'
	],
	#category : #'Cormas-Tests-Project'
}

{ #category : #accessing }
CMModel2ProjectMigratorTest >> migrator [

	^ migrator
]

{ #category : #accessing }
CMModel2ProjectMigratorTest >> migrator: anObject [

	migrator := anObject
]

{ #category : #running }
CMModel2ProjectMigratorTest >> setUp [
	super setUp.
	
	self migrator: CMModel2ProjectMigrator new.
]

{ #category : #test }
CMModel2ProjectMigratorTest >> testCurrentModel [

	self migrator currentModel: CMMockModel new.
	self assert: (self migrator currentModel isKindOf: CMMockModel).


]

{ #category : #test }
CMModel2ProjectMigratorTest >> testDestinationPath [

	self assert: (self migrator destinationPath isKindOf: FileReference).
	self assert: self migrator destinationPath isDirectory.

]

{ #category : #test }
CMModel2ProjectMigratorTest >> testMetadataFilename [

	self assert: (self migrator metadataFilename isKindOf: String).
	self deny: self migrator metadataFilename isEmpty.
	self assert: (self migrator metadataFilename endsWith: 'ston')
]

{ #category : #test }
CMModel2ProjectMigratorTest >> testModelPackageNames [

	self assert: (self migrator modelPackageNames isKindOf: Collection).
	self deny: self migrator modelPackageNames isEmpty.
	self assert: (self migrator modelPackageNames allSatisfy: [ : pkgName | pkgName isKindOf: String ]).
	


]

{ #category : #test }
CMModel2ProjectMigratorTest >> testOutputDirectory [

	self assert: (self migrator outputDirectory isKindOf: String).
	self deny: self migrator outputDirectory isEmpty.

]

{ #category : #test }
CMModel2ProjectMigratorTest >> testResourceDirectoryNames [

	self assert: (self migrator resourceDirectoryNames isKindOf: Collection).
	self deny: self migrator resourceDirectoryNames isEmpty.
	self assert: (self migrator resourceDirectoryNames allSatisfy: [ : rdn | rdn isKindOf: String ])

]

{ #category : #test }
CMModel2ProjectMigratorTest >> testTempLocation [

	self assert: (self migrator tempLocation isKindOf: FileLocator).
	self assert: self migrator tempLocation isDirectory.

]
