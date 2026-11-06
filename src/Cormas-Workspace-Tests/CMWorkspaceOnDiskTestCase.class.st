"
I am the common fixture of the tests of `CMWorkspace` that load models with Metacello, which cannot read a memory file system.

I create a workspace in a new temporary folder on disk, and I write small models such as `CMWorkspaceMock` there as Tonel files. After each test, I remove their packages, unregister their baselines and delete the folder.
"
Class {
	#name : 'CMWorkspaceOnDiskTestCase',
	#superclass : 'TestCase',
	#instVars : [
		'workspace',
		'directory'
	],
	#category : 'Cormas-Workspace-Tests',
	#package : 'Cormas-Workspace-Tests'
}

{ #category : 'testing' }
CMWorkspaceOnDiskTestCase class >> isAbstract [

	^ self = CMWorkspaceOnDiskTestCase
]

{ #category : 'helpers' }
CMWorkspaceOnDiskTestCase >> isLoaded: aPackageName [

	^ PackageOrganizer default hasPackage: aPackageName
]

{ #category : 'helpers' }
CMWorkspaceOnDiskTestCase >> mockClass [

	^ self class environment at: #CMWorkspaceMockModel
]

{ #category : 'helpers' }
CMWorkspaceOnDiskTestCase >> mockFolderNamed: aFolderName [
	"Write the model CMWorkspaceMock, with one package and one model class, in a folder of Models"

	| folder |
	folder := workspace modelsFolder / aFolderName.
	self
		writeModel: 'CMWorkspaceMock'
		spec: 'spec package: ''CMWorkspaceMock-Model'''
		in: folder.
	self
		writePackage: 'CMWorkspaceMock-Model'
		withModelClass: 'CMWorkspaceMockModel'
		in: folder.
	^ CMModelFolder in: workspace at: folder
]

{ #category : 'helpers' }
CMWorkspaceOnDiskTestCase >> onlyBackup [

	self assert: workspace backupsFolder children size equals: 1.
	^ workspace backupsFolder children first
]

{ #category : 'running' }
CMWorkspaceOnDiskTestCase >> setUp [

	super setUp.
	directory := FileLocator temp asFileReference
	             / ('cormas-install-test-' , UUID new asString).
	workspace := CMWorkspace createAt: directory
]

{ #category : 'running' }
CMWorkspaceOnDiskTestCase >> tearDown [

	(PackageOrganizer default packages select: [ :each |
			 (each name beginsWith: 'CMWorkspaceMock') or: [
				 each name beginsWith: 'BaselineOfCMWorkspaceMock' ] ]) do: [
		:each | each removeFromSystem ].
	#( 'CMWorkspaceMock' 'CMWorkspaceMockFire' ) do: [ :each |
			Metacello new
				baseline: each;
				unregister ].
	Smalltalk image cleanOutUndeclared.
	directory ensureDeleteAll.
	super tearDown
]

{ #category : 'helpers' }
CMWorkspaceOnDiskTestCase >> unzip: aZipFile [

	| folder |
	folder := directory / 'Unzipped'.
	folder ensureCreateDirectory.
	(ZipArchive new readFrom: aZipFile) extractAllTo: folder.
	^ folder
]

{ #category : 'helpers' }
CMWorkspaceOnDiskTestCase >> write: aString to: aFile [

	aFile writeStreamDo: [ :stream | stream nextPutAll: aString ]
]

{ #category : 'helpers' }
CMWorkspaceOnDiskTestCase >> writeModel: aBaselineName spec: aSpecString in: aFolder [
	"Write cormas.json and the Tonel files of a baseline whose baseline: method holds aSpecString"

	| src baseline |
	src := aFolder / 'src'.
	baseline := 'BaselineOf' , aBaselineName.
	(src / baseline) ensureCreateDirectory.
	self
		write: '{ "baseline": "' , aBaselineName , '" }'
		to: aFolder / 'cormas.json'.
	self
		write: '{
	#format : #tonel
}'
		to: src / '.properties'.
	self
		write: 'Package { #name : ''' , baseline , ''' }'
		to: src / baseline / 'package.st'.
	self
		write: 'Class {
	#name : ''' , baseline , ''',
	#superclass : ''BaselineOf'',
	#category : ''' , baseline , ''',
	#package : ''' , baseline , '''
}

{ #category : ''baselines'' }
' , baseline , ' >> baseline: spec [
	<baseline>
	spec for: #common do: [ ' , aSpecString , ' ]
]
'
		to: src / baseline / (baseline , '.class.st')
]

{ #category : 'helpers' }
CMWorkspaceOnDiskTestCase >> writePackage: aPackageName withModelClass: aClassName in: aFolder [

	| package |
	package := aFolder / 'src' / aPackageName.
	package ensureCreateDirectory.
	self
		write: 'Package { #name : ''' , aPackageName , ''' }'
		to: package / 'package.st'.
	self
		write: 'Class {
	#name : ''' , aClassName , ''',
	#superclass : ''CMModel'',
	#category : ''' , aPackageName , ''',
	#package : ''' , aPackageName , '''
}
'
		to: package / (aClassName , '.class.st')
]
