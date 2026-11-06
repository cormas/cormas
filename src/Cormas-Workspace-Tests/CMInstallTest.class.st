"
I test how `CMWorkspace` installs and uninstalls a model and deletes a folder: loading its packages, remembering its folder, refusing an installation that would replace code already in the image, and backing up before removing anything.

Metacello cannot load from a memory file system, so I write small models such as `CMWorkspaceMock` in Tonel files in a temporary folder on disk. I remove their packages and the folder after each test.
"
Class {
	#name : 'CMInstallTest',
	#superclass : 'TestCase',
	#instVars : [
		'workspace',
		'directory'
	],
	#category : 'Cormas-Workspace-Tests',
	#package : 'Cormas-Workspace-Tests'
}

{ #category : 'helpers' }
CMInstallTest >> isLoaded: aPackageName [

	^ PackageOrganizer default hasPackage: aPackageName
]

{ #category : 'helpers' }
CMInstallTest >> mockClass [

	^ self class environment at: #CMWorkspaceMockModel
]

{ #category : 'helpers' }
CMInstallTest >> mockFolderNamed: aFolderName [
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
CMInstallTest >> onlyBackup [

	self assert: workspace backupsFolder children size equals: 1.
	^ workspace backupsFolder children first
]

{ #category : 'running' }
CMInstallTest >> setUp [

	super setUp.
	directory := FileLocator temp asFileReference
	             / ('cormas-install-test-' , UUID new asString).
	workspace := CMWorkspace createAt: directory
]

{ #category : 'running' }
CMInstallTest >> tearDown [

	#( 'CMWorkspaceMock-Model' 'CMWorkspaceMockFire-Model'
	   'BaselineOfCMWorkspaceMock' 'BaselineOfCMWorkspaceMockFire' ) do: [
			:each |
			(PackageOrganizer default packageNamed: each ifAbsent: [ nil ])
				ifNotNil: [ :package | package removeFromSystem ] ].
	#( 'CMWorkspaceMock' 'CMWorkspaceMockFire' ) do: [ :each |
			Metacello new
				baseline: each;
				unregister ].
	directory ensureDeleteAll.
	super tearDown
]

{ #category : 'tests - uninstall' }
CMInstallTest >> testBackUpOfTheCodeInTheImageCanBeInstalled [

	| unzipped restored |
	workspace install: (self mockFolderNamed: 'Mock').
	self mockClass compile: 'answer ^ 42' classified: 'editing'.
	workspace uninstall: 'CMWorkspaceMock'.
	unzipped := self unzip: self onlyBackup.
	restored := workspace modelsFolder / 'Restored'.
	unzipped children first moveTo: restored.
	workspace install: (CMModelFolder in: workspace at: restored).
	self assert: self mockClass new answer equals: 42
]

{ #category : 'tests - uninstall' }
CMInstallTest >> testDeleteACopyKeepsTheInstalledModel [

	| original copy |
	original := self mockFolderNamed: 'Mock'.
	copy := self mockFolderNamed: 'Mock copy'.
	workspace install: original.
	workspace delete: copy.
	self assert: (workspace isInstalled: 'CMWorkspaceMock').
	self assert: (self isLoaded: 'CMWorkspaceMock-Model')
]

{ #category : 'tests - uninstall' }
CMInstallTest >> testDeleteAFolderThatIsNotAModel [

	| folder |
	folder := workspace modelsFolder / 'Untitled folder'.
	folder ensureCreateDirectory.
	workspace delete: (CMModelFolder in: workspace at: folder).
	self deny: folder exists
]

{ #category : 'tests - uninstall' }
CMInstallTest >> testDeleteBacksUpThenDeletesTheFolder [

	| folder unzipped |
	folder := self mockFolderNamed: 'Mock'.
	(folder location / 'data') ensureCreateDirectory.
	self write: '1,2,3' to: folder location / 'data' / 'map.csv'.
	workspace delete: folder.
	self deny: folder location exists.
	unzipped := self unzip: self onlyBackup.
	self
		assert: (unzipped / 'Mock' / 'data' / 'map.csv') contents
		equals: '1,2,3'
]

{ #category : 'tests - uninstall' }
CMInstallTest >> testDeleteTheFolderOfAnInstalledModelUninstallsIt [

	| folder |
	folder := self mockFolderNamed: 'Mock'.
	workspace install: folder.
	workspace delete: folder.
	self deny: folder location exists.
	self deny: (self isLoaded: 'CMWorkspaceMock-Model').
	self deny: (workspace isInstalled: 'CMWorkspaceMock').
	self assert: workspace backupsFolder children size equals: 2
]

{ #category : 'tests' }
CMInstallTest >> testFailedInstallRemovesWhatItLoaded [

	| folder |
	folder := workspace modelsFolder / 'Mock'.
	self
		writeModel: 'CMWorkspaceMock'
		spec:
		'spec package: ''CMWorkspaceMock-Model''; package: ''CMWorkspaceMock-Missing'''
		in: folder.
	self
		writePackage: 'CMWorkspaceMock-Model'
		withModelClass: 'CMWorkspaceMockModel'
		in: folder.
	self
		should: [
		workspace install: (CMModelFolder in: workspace at: folder) ]
		raise: CMWorkspaceError
		withExceptionDo: [ :error |
				self assert:
					(error messageText includesSubstring: 'CMWorkspaceMock-Missing') ].
	self deny: (self isLoaded: 'CMWorkspaceMock-Model').
	self deny: (self isLoaded: 'BaselineOfCMWorkspaceMock').
	self deny: (workspace isInstalled: 'CMWorkspaceMock')
]

{ #category : 'tests' }
CMInstallTest >> testFolderOfAModelClassAndOfItsInstances [

	| folder previous |
	folder := self mockFolderNamed: 'Mock'.
	workspace install: folder.
	previous := CMWorkspace instVarNamed: 'current'.
	[
		CMWorkspace current: workspace.
		self assert: self mockClass folder equals: folder location.
		self assert: self mockClass basicNew folder equals: folder location ]
		ensure: [ CMWorkspace instVarNamed: 'current' put: previous ]
]

{ #category : 'tests' }
CMInstallTest >> testFolderOfAModelNotInstalledFromTheWorkspaceRaisesAnError [

	workspace install: (self mockFolderNamed: 'Mock').
	self
		should: [ workspace folderOf: CMMockModel ]
		raise: CMWorkspaceError
]

{ #category : 'tests' }
CMInstallTest >> testInstallAFolderThatIsNotAModelRaisesAnError [

	(workspace modelsFolder / 'Untitled folder') ensureCreateDirectory.
	self
		should: [
				workspace install: (CMModelFolder
						 in: workspace
						 at: workspace modelsFolder / 'Untitled folder') ]
		raise: CMWorkspaceError
]

{ #category : 'tests - uninstall' }
CMInstallTest >> testInstallAgainAfterUninstall [

	| folder |
	folder := self mockFolderNamed: 'Mock'.
	workspace install: folder.
	workspace uninstall: 'CMWorkspaceMock'.
	workspace install: folder.
	self assert:
		(self class environment includesKey: #CMWorkspaceMockModel).
	self assert: (workspace isInstalled: 'CMWorkspaceMock')
]

{ #category : 'tests' }
CMInstallTest >> testInstallIsRefusedWhenAPackageOfTheModelIsAlreadyLoaded [

	PackageOrganizer default ensurePackage: 'CMWorkspaceMock-Model'.
	self
		should: [ workspace install: (self mockFolderNamed: 'Mock') ]
		raise: CMWorkspaceError
		withExceptionDo: [ :error |
				self assert: (error messageText includesSubstring:
						 'CMWorkspaceMock-Model is already in this image') ].
	self assert: (self isLoaded: 'CMWorkspaceMock-Model').
	self deny: (self isLoaded: 'BaselineOfCMWorkspaceMock').
	self deny:
		(self class environment includesKey: #CMWorkspaceMockModel).
	self deny: (workspace isInstalled: 'CMWorkspaceMock')
]

{ #category : 'tests' }
CMInstallTest >> testInstallIsRefusedWhenTheBaselineIsAlreadyLoaded [

	PackageOrganizer default ensurePackage: 'BaselineOfCMWorkspaceMock'.
	self
		should: [ workspace install: (self mockFolderNamed: 'Mock') ]
		raise: CMWorkspaceError.
	self assert: (self isLoaded: 'BaselineOfCMWorkspaceMock').
	self deny: (self isLoaded: 'CMWorkspaceMock-Model')
]

{ #category : 'tests' }
CMInstallTest >> testInstallIsRefusedWhenTheModelDependsOnAnInstalledModel [

	| fire |
	workspace install: (self mockFolderNamed: 'Mock').
	fire := workspace modelsFolder / 'Fire'.
	self
		writeModel: 'CMWorkspaceMockFire'
		spec:
		'spec baseline: ''CMWorkspaceMock'' with: [ spec repository: ''github://cormas/nowhere:main/src'' ]; package: ''CMWorkspaceMockFire-Model'''
		in: fire.
	self
		writePackage: 'CMWorkspaceMockFire-Model'
		withModelClass: 'CMWorkspaceMockFireModel'
		in: fire.
	self
		should: [ workspace install: (CMModelFolder in: workspace at: fire) ]
		raise: CMWorkspaceError
		withExceptionDo: [ :error |
				self assert:
					(error messageText includesSubstring: 'needs CMWorkspaceMock') ].
	self deny: (self isLoaded: 'BaselineOfCMWorkspaceMockFire').
	self deny: (self isLoaded: 'CMWorkspaceMockFire-Model').
	self assert: (workspace isInstalled: 'CMWorkspaceMock')
]

{ #category : 'tests' }
CMInstallTest >> testInstallLoadsThePackagesOfTheModel [

	workspace install: (self mockFolderNamed: 'Mock').
	self assert: (self isLoaded: 'CMWorkspaceMock-Model').
	self assert:
		(self class environment includesKey: #CMWorkspaceMockModel)
]

{ #category : 'tests' }
CMInstallTest >> testInstallRemembersTheFolderOfTheModel [

	| folder |
	folder := self mockFolderNamed: 'Mock'.
	workspace install: folder.
	self assert: (workspace isInstalled: 'CMWorkspaceMock').
	self
		assert: (workspace folderOf: self mockClass)
		equals: folder location
]

{ #category : 'tests' }
CMInstallTest >> testInstallTheSameModelFromAnotherFolderRaisesAnError [

	| original |
	original := self mockFolderNamed: 'Mock'.
	workspace install: original.
	self
		should: [ workspace install: (self mockFolderNamed: 'Mock copy') ]
		raise: CMWorkspaceError.
	self
		assert: (workspace folderOf: self mockClass)
		equals: original location
]

{ #category : 'tests - uninstall' }
CMInstallTest >> testUninstallAModelThatIsNotInstalledRaisesAnError [

	self
		should: [ workspace uninstall: 'CMWorkspaceMock' ]
		raise: CMWorkspaceError
]

{ #category : 'tests - uninstall' }
CMInstallTest >> testUninstallBacksUpTheCodeInTheImage [

	| unzipped model |
	workspace install: (self mockFolderNamed: 'Mock').
	self mockClass compile: 'answer ^ 42' classified: 'editing'.
	workspace uninstall: 'CMWorkspaceMock'.
	unzipped := self unzip: self onlyBackup.
	model := unzipped children first.
	self
		assert: (CMModelFolder in: workspace at: model) baselineName
		equals: 'CMWorkspaceMock'.
	self assert: (model / 'src' / 'BaselineOfCMWorkspaceMock'
		 / 'BaselineOfCMWorkspaceMock.class.st') isFile.
	self assert: ((model / 'src' / 'CMWorkspaceMock-Model'
		  / 'CMWorkspaceMockModel.class.st') contents includesSubstring:
			 'answer')
]

{ #category : 'tests - uninstall' }
CMInstallTest >> testUninstallLeavesTheFolderUntouched [

	| folder |
	folder := self mockFolderNamed: 'Mock'.
	workspace install: folder.
	workspace uninstall: 'CMWorkspaceMock'.
	self assert: folder isModel.
	self assert: (folder location / 'src' / 'CMWorkspaceMock-Model'
		 / 'CMWorkspaceMockModel.class.st') isFile
]

{ #category : 'tests - uninstall' }
CMInstallTest >> testUninstallRemovesTheCodeOfTheModel [

	workspace install: (self mockFolderNamed: 'Mock').
	workspace uninstall: 'CMWorkspaceMock'.
	self deny: (self isLoaded: 'CMWorkspaceMock-Model').
	self deny: (self isLoaded: 'BaselineOfCMWorkspaceMock').
	self deny: (workspace isInstalled: 'CMWorkspaceMock')
]

{ #category : 'tests - uninstall' }
CMInstallTest >> testUninstallWhenTheFolderIsGone [

	| folder |
	folder := self mockFolderNamed: 'Mock'.
	workspace install: folder.
	folder location deleteAll.
	workspace uninstall: 'CMWorkspaceMock'.
	self deny: (self isLoaded: 'CMWorkspaceMock-Model').
	self assert: self onlyBackup isFile
]

{ #category : 'helpers' }
CMInstallTest >> unzip: aZipFile [

	| folder |
	folder := directory / 'Unzipped'.
	folder ensureCreateDirectory.
	(ZipArchive new readFrom: aZipFile) extractAllTo: folder.
	^ folder
]

{ #category : 'helpers' }
CMInstallTest >> write: aString to: aFile [

	aFile writeStreamDo: [ :stream | stream nextPutAll: aString ]
]

{ #category : 'helpers' }
CMInstallTest >> writeModel: aBaselineName spec: aSpecString in: aFolder [
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
CMInstallTest >> writePackage: aPackageName withModelClass: aClassName in: aFolder [

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
