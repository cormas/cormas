"
I test how a workspace exports a model folder as a zip and installs a model from a zip: the zip holds the whole folder, and installing extracts it into a new folder of `Models`, never over another one, whatever the way the zip was made.

I work on disk, with the fixture of `CMWorkspaceOnDiskTestCase`.
"
Class {
	#name : 'CMZipTest',
	#superclass : 'CMWorkspaceOnDiskTestCase',
	#category : 'Cormas-Workspace-Tests',
	#package : 'Cormas-Workspace-Tests'
}

{ #category : 'helpers' }
CMZipTest >> mockFolder [

	^ workspace modelsFolder / 'Mock'
]

{ #category : 'helpers' }
CMZipTest >> mockOutsideNamed: aName [

	| folder |
	folder := self outsideFolder / aName.
	self
		writeModel: 'CMWorkspaceMock'
		spec: 'spec package: ''CMWorkspaceMock-Model'''
		in: folder.
	self
		writePackage: 'CMWorkspaceMock-Model'
		withModelClass: 'CMWorkspaceMockModel'
		in: folder.
	^ folder
]

{ #category : 'helpers' }
CMZipTest >> outsideFolder [
	"A folder outside the workspace, where a zip is prepared as someone else would"

	^ (directory / 'Outside') ensureCreateDirectory
]

{ #category : 'tests - export' }
CMZipTest >> testExportZipsTheWholeFolder [

	| unzipped |
	self mockFolderNamed: 'Mock'.
	(self mockFolder / 'data') ensureCreateDirectory.
	self write: '1,2,3' to: self mockFolder / 'data' / 'map.csv'.
	(self mockFolder / '.git') ensureCreateDirectory.
	self write: '[core]' to: self mockFolder / '.git' / 'config'.
	workspace
		export: (CMModelFolder in: workspace at: self mockFolder)
		to: self zipFile.
	unzipped := self unzip: self zipFile.
	self
		assert: (unzipped / 'Mock' / 'data' / 'map.csv') contents
		equals: '1,2,3'.
	self
		assert: (unzipped / 'Mock' / '.git' / 'config') contents
		equals: '[core]'.
	self assert: (unzipped / 'Mock' / 'cormas.json') isFile
]

{ #category : 'tests - export' }
CMZipTest >> testExportedModelInstallsBack [

	workspace install: (self mockFolderNamed: 'Mock').
	workspace
		export: (CMModelFolder in: workspace at: self mockFolder)
		to: self zipFile.
	workspace delete: (CMModelFolder in: workspace at: self mockFolder).
	workspace installFromZip: self zipFile.
	self assert: (workspace isInstalled: 'CMWorkspaceMock').
	self
		assert: (workspace installedModelNamed: 'CMWorkspaceMock') folder
		equals: self mockFolder.
	self assert:
		(self class environment includesKey: #CMWorkspaceMockModel)
]

{ #category : 'tests - install' }
CMZipTest >> testInstallFromAFileThatIsNotAZipRaisesAnErrorAndLeavesNothing [

	self write: 'not a zip' to: self zipFile.
	self
		should: [ workspace installFromZip: self zipFile ]
		raise: CMWorkspaceError.
	self assert: workspace modelsFolder children isEmpty
]

{ #category : 'tests - install' }
CMZipTest >> testInstallFromAZipMadeOnAMac [

	| macFolder |
	self mockOutsideNamed: 'Mock'.
	macFolder := self outsideFolder / '__MACOSX' / 'Mock'.
	macFolder ensureCreateDirectory.
	self write: 'resource fork' to: macFolder / '._cormas.json'.
	self zip: self outsideFolder relativeTo: self outsideFolder.
	self
		assert: (workspace installFromZip: self zipFile) location
		equals: self mockFolder
]

{ #category : 'tests - install' }
CMZipTest >> testInstallFromAZipOfAModelAlreadyInstalledKeepsItsFolder [

	workspace install: (self mockFolderNamed: 'Mock').
	self
		zip: (self mockOutsideNamed: 'Mock')
		relativeTo: self outsideFolder.
	self
		should: [ workspace installFromZip: self zipFile ]
		raise: CMWorkspaceError.
	self assert:
		(workspace modelsFolder / 'Mock 2' / 'cormas.json') isFile.
	self
		assert: (workspace installedModelNamed: 'CMWorkspaceMock') folder
		equals: self mockFolder
]

{ #category : 'tests - install' }
CMZipTest >> testInstallFromAZipOfAModelOneLevelDown [

	| outer folder |
	outer := self outsideFolder / 'Mock'.
	self mockOutsideNamed: 'Mock/Mock'.
	self zip: outer relativeTo: self outsideFolder.
	folder := workspace installFromZip: self zipFile.
	self assert: folder location equals: self mockFolder.
	self assert: (self mockFolder / 'cormas.json') isFile
]

{ #category : 'tests - install' }
CMZipTest >> testInstallFromAZipOfTheContentsOfAFolder [

	| model archive |
	model := self mockOutsideNamed: 'Forest'.
	archive := ZipArchive new.
	model children do: [ :each |
			each isDirectory
				ifTrue: [
				archive addTree: each relativeTo: model match: [ :file | true ] ]
				ifFalse: [ archive addFile: each as: each basename ] ].
	archive writeToFile: self zipFile.
	self
		assert: (workspace installFromZip: self zipFile) location
		equals: self mockFolder
]

{ #category : 'tests - install' }
CMZipTest >> testInstallFromAZipWithoutAModelRaisesAnErrorAndLeavesNothing [

	(self outsideFolder / 'Photos') ensureCreateDirectory.
	self
		write: 'a picture'
		to: self outsideFolder / 'Photos' / 'tree.png'.
	self
		zip: self outsideFolder / 'Photos'
		relativeTo: self outsideFolder.
	self
		should: [ workspace installFromZip: self zipFile ]
		raise: CMWorkspaceError.
	self assert: workspace modelsFolder children isEmpty
]

{ #category : 'tests - install' }
CMZipTest >> testInstallFromZipNeverReplacesAFolder [

	| folder |
	self mockFolder ensureCreateDirectory.
	self write: 'mine' to: self mockFolder / 'notes.txt'.
	self
		zip: (self mockOutsideNamed: 'Mock')
		relativeTo: self outsideFolder.
	folder := workspace installFromZip: self zipFile.
	self
		assert: folder location
		equals: workspace modelsFolder / 'Mock 2'.
	self assert: (self mockFolder / 'notes.txt') contents equals: 'mine'
]

{ #category : 'tests - install' }
CMZipTest >> testInstallFromZipReturnsTheNewFolder [

	| folder |
	self
		zip: (self mockOutsideNamed: 'Forest')
		relativeTo: self outsideFolder.
	folder := workspace installFromZip: self zipFile.
	self
		assert: folder location
		equals: workspace modelsFolder / 'Forest'.
	self
		assert: (workspace installedModelNamed: 'CMWorkspaceMock') folder
		equals: folder location
]

{ #category : 'helpers' }
CMZipTest >> zip: aFolder relativeTo: aParent [

	ZipArchive new
		addTree: aFolder relativeTo: aParent match: [ :each | true ];
		writeToFile: self zipFile
]

{ #category : 'helpers' }
CMZipTest >> zipFile [

	^ directory / 'Mock.zip'
]
