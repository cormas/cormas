"
I am the Cormas models window: the list of the models of the workspace, with the screenshot, description and actions of the selected one. Everything the modeler does with models starts here: create, install, run, version, share and delete them.

## Responsibility:

- I show the entries of the workspace and keep them up to date, whoever changes the workspace.
- I offer the actions that make sense for the selected entry, and run them, explaining why Cormas refused one.
- I ask the modeler before anything that cannot be undone, or that installs a model this Cormas has not checked.

## Collaborators:

- `CMWorkspace` does the work and announces `CMWorkspaceChanged`, which I listen to.
- `CMModelListEntry` gives each row and its description.
- `CMNewModelPresenter` creates a model; `CMWorkspaceChooser` changes the workspace.
- `UIManager` asks the modeler simple questions.

## Public API and Key Messages

- `CMModelListPresenter open` opens me on the workspace of the image, asking for one first if needed, after bringing the installed models up to date with their folders.
- `CMModelListPresenter on: aWorkspace` creates me on another workspace.
- `selectEntryNamed: aName` selects a row.

```smalltalk
CMModelListPresenter open
```

## Internal Representation

- `workspace` is the `CMWorkspace` I show.
- `table` lists the entries; `screenshot`, `description` and `actions` show the selected one.
- `toolbar` and `workspaceLabel` hold the actions on the whole workspace and its location.

### Implementation Points

- The actions of an entry are built again at each selection, from `mainActionsFor:` and `folderActionsFor:`.
- Every action runs through `run:`, which shows a `CMWorkspaceError` as an alert and updates the entries.
- I update the entries after the change that announced it is over, never in the middle of a compilation.
"
Class {
	#name : 'CMModelListPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'workspace',
		'toolbar',
		'workspaceLabel',
		'table',
		'screenshot',
		'description',
		'actions'
	],
	#category : 'Cormas-UI',
	#package : 'Cormas-UI'
}

{ #category : 'as yet unclassified' }
CMModelListPresenter class >> loadMicroUmlPlugin [

	Metacello new
		onConflictUseLoaded;
		baseline: 'CormasMicroUML';
		repository: 'github://cormas/cormas-microuml:main';
		load.
]

{ #category : 'as yet unclassified' }
CMModelListPresenter class >> loadTelegramPlugin [

	Metacello new
		onConflictUseLoaded;
		baseline: 'CormasTelegram';
		repository: 'github://cormas/cormas-telegram';
		load.
]

{ #category : 'menu' }
CMModelListPresenter class >> menu00CormasOn: aBuilder [
	<worldMenu>
	(aBuilder item: #Cormas)
		label: 'Cormas';
		"icon: CMIcons cormasIcon;"
		help: 'Agent-based modeling and simulations';
		order: 2.
		
	(aBuilder group: #CormasMain)
		order: 1;
		parent: #Cormas;
		withSeparatorAfter.
		
	(aBuilder group: #CormasRepositories)
		order: 1;
		parent: #Cormas;
		withSeparatorAfter.
		
	(aBuilder item: #NewCormasModel)
		parent: #CormasMain;
		label: 'New model';
		icon: (self iconNamed: #smallNew);
		help: 'Create a new Cormas model';
		action: [ CMNewModelPresenter open ];
		order: 1.
		
	(aBuilder item: #CormasModels)
		parent: #CormasMain;
		label: 'Models';
		icon: (self iconNamed: #smallOpen);
		help: 'The models of the workspace and the examples of the catalog';
		action: [ self open ];
		order: 1.
		
	(aBuilder item: #MethodDocumentation)
		parent: #CormasMain;
		label: 'Method Documentation';
		icon: (self iconNamed: #help);
		help: 'Documentation of the public methods of Cormas classes';
		action: [ CMDocumentationBrowser new open ];
		order: 1.
		
	(aBuilder item: #CormasTilesetBrowser)
		parent: #CormasMain;
		label: 'Tileset browser';
		icon: (self iconNamed: #versionControl);
		help: 'Browse Cormas tilesets';
		action: [CMTilesetBrowser new open ];
		order: 1.
		
	(aBuilder item: #LoadMicroUMLPlugin)
		parent: #Cormas ;
		label: 'Load MicroUML plugin';
		icon: (self iconNamed: #changeUpdate);
		help: 'Load MicroUML plugin';
		action: [ self loadMicroUmlPlugin ];
		order: 1.
		
	(aBuilder item: #LoadTelegramPlugin)
		parent: #Cormas ;
		label: 'Load Telegram plugin';
		icon: self telegramIcon;
		help: 'Load Telegram plugin';
		action: [ self loadTelegramPlugin ];
		order: 1.
		
	(aBuilder item: #CormasWebsite)
		parent: #Cormas ;
		label: 'Cormas website';
		icon: (self iconNamed: #remote);
		help: 'Open Cormas website in a web browser';
		action: [ WebBrowser openOn: 'https://cormas.org' ];
		order: 1.
		
	(aBuilder item: #ColorPicker)
		parent: #Cormas ;
		label: 'Color Picker';
		icon: (self iconNamed: #paint);
		help: 'Open color picker';
		action: [ SpColorPickerPresenter open ];
		order: 1.
]

{ #category : 'menu' }
CMModelListPresenter class >> menu01WorkspaceOn: aBuilder [

	<worldMenu>
	(aBuilder item: #CormasWorkingDirectory)
		parent: #CormasMain;
		label: 'Change working directory…';
		icon: (self iconNamed: #open);
		help:
			'Choose the workspace folder where this image keeps its models';
		action: [ CMWorkspaceChooser open ];
		order: 2
]

{ #category : 'opening' }
CMModelListPresenter class >> open [
	"Open the list on the workspace of the image, asking the modeler to choose one first if needed, and bring the installed models up to date with their folders"

	| workspace |
	workspace := CMWorkspace currentIfNone: [
			             CMWorkspaceChooser open.
			             CMWorkspace currentIfNone: [ ^ nil ] ].
	workspace refresh.
	^ (self on: workspace) open
]

{ #category : 'accessing' }
CMModelListPresenter class >> screenshotSize [

	^ 300
]

{ #category : 'as yet unclassified' }
CMModelListPresenter class >> telegramIcon [
	<script: 'self telegramIcon inspect'>

	^ (Form fromBinaryStream: self telegramIconBase64 base64Decoded asByteArray readStream)
		scaledToSize: 20@20
]

{ #category : 'as yet unclassified' }
CMModelListPresenter class >> telegramIconBase64 [

	^ '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ACx0RVh0ZXhpZjpTb2Z0d2FyZQBBZG9iZSBQaG90b3Nob3AgMjEuMSAoV2luZG93cykwackZAAAAFXRFWHRwaG90b3Nob3A6Q29sb3JNb2RlADNWArNAAAAAEnRFWHR0aWZmOk9yaWVudGF0aW9uADG3q/w7AAAAKHRFWHR4bXA6Q3JlYXRlRGF0ZQAyMDIxLTAyLTAxVDAyOjE2OjM4KzAyOjAws/TExAAAAC50RVh0eG1wOkNyZWF0b3JUb29sAEFkb2JlIFBob3Rvc2hvcCAyMS4xIChXaW5kb3dzKVBDAQcAAAAqdEVYdHhtcDpNZXRhZGF0YURhdGUAMjAyMS0wMi0wMVQwMjoxNjozOCswMjowMDuuq0MAAAAodEVYdHhtcDpNb2RpZnlEYXRlADIwMjEtMDItMDFUMDI6MTY6MzgrMDI6MDAHCvj9AAAAS3RFWHR4bXBNTTpEb2N1bWVudElEAGFkb2JlOmRvY2lkOnBob3Rvc2hvcDo2ODc5ZGQwYy1hMTE5LTNkNDEtYTE5Mi05OWY4ZGE0YmM0MGHRBfCtAAAAPXRFWHR4bXBNTTpJbnN0YW5jZUlEAHhtcC5paWQ6Mjc3ZTk0YzAtNmZlMi0zNjQyLWI1MmMtYzQyZTcyMzYzNGNhaM6nrQAAAEV0RVh0eG1wTU06T3JpZ2luYWxEb2N1bWVudElEAHhtcC5kaWQ6ZmZlN2RlZWMtZjQxNS1hMDQyLWIyNmItMTI3ODk2N2MxM2QyAakZuwAAAABJRU5ErkJggg=='
]

{ #category : 'updating' }
CMModelListPresenter >> actionsLayoutFor: anEntry [
	"The main actions of the entry on a first row, those that remove or move it on a second"

	^ SpBoxLayout newTopToBottom
		  spacing: 5;
		  add: (self rowOfButtons: (self mainActionsFor: anEntry))
		  height: 30;
		  add: (self rowOfButtons: (self folderActionsFor: anEntry))
		  height: 30;
		  yourself
]

{ #category : 'actions' }
CMModelListPresenter >> analyseSensitivityOf: anEntry [

	| presenter |
	presenter := CMSensitivityAnalysisSetupPresenter new.
	presenter selectModel: (self modelClassOf: anEntry).
	presenter open.
	presenter window centered
]

{ #category : 'actions' }
CMModelListPresenter >> changeWorkspace [
	"Let the modeler choose another workspace. Every window showing the previous one, me included, is then told to show it"

	CMWorkspaceChooser open.
	(CMWorkspace currentIfNone: [ workspace ]) == workspace ifFalse: [
		self showWorkspace: CMWorkspace current ]
]

{ #category : 'actions' }
CMModelListPresenter >> chooseCatalogVersionOf: anEntry [
	"Let the modeler choose among the versions of an example that the catalog line offers to this Cormas, and check it out in place"

	| versions recommended current labels index version |
	versions := workspace catalog versionsOf: anEntry catalogModel.
	recommended := versions first.
	current := anEntry folder commit.
	labels := versions collect: [ :each |
			          String streamContents: [ :stream |
					          stream
						          nextPutAll: (each at: 'ref');
						          nextPutAll: ', made with Cormas ';
						          nextPutAll: (each at: 'cormas').
					          each == recommended ifTrue: [
						          stream nextPutAll: ' (recommended)' ].
					          (each at: 'commit') = current ifTrue: [
						          stream nextPutAll: ' (current)' ] ] ].
	index := UIManager default
		         chooseFrom: labels
		         title: 'Versions of ' , anEntry baseline
			         ,
			         '. An example stays at a version other than the recommended one when examples are updated.'.
	(index isNil or: [ index = 0 ]) ifTrue: [ ^ self ].
	version := versions at: index.
	UIManager default
		informUser: 'Getting ' , (version at: 'ref') , '…'
		during: [ workspace chooseVersion: version of: anEntry folder ].
	self updateEntries
]

{ #category : 'actions' }
CMModelListPresenter >> chooseTagOf: anEntry [
	"Let the modeler choose between their working version and the tags of its folder, and install the chosen one in place of the installed one. An old version is cloned into its own folder of Models: the working folder is never touched"

	| working tags installedFolder labels index target |
	working := anEntry folder isOldVersion
		           ifTrue: [ anEntry folder workingFolder ]
		           ifFalse: [ anEntry folder ].
	working ifNil: [
			^ UIManager default alert: 'The working folder of ' , anEntry name
				  , ' is gone, so there are no other versions to choose.' ].
	tags := working tags.
	installedFolder := (workspace isInstalled: anEntry baseline)
		                   ifTrue: [
		                   (workspace installedModelNamed: anEntry baseline)
			                   folder ]
		                   ifFalse: [ nil ].
	labels := { ('My working version' -> working location) }
	          , (tags collect: [ :each |
				           each
				           ->
				           (workspace modelsFolder
				            / (working location basename , ' ' , each)) ])
		          collect: [ :each |
				          each value = installedFolder
					          ifTrue: [ each key , ' (installed)' ]
					          ifFalse: [ each key ] ].
	index := UIManager default
		         chooseFrom: labels
		         title: 'Versions of ' , anEntry baseline
			         ,
			         '. An old version opens in its own folder: your working folder is not touched.'.
	(index isNil or: [ index = 0 ]) ifTrue: [ ^ self ].
	index = 1
		ifTrue: [ target := working ]
		ifFalse: [
				UIManager default
					informUser: 'Getting ' , (tags at: index - 1) , '…'
					during: [
						target := workspace
							          folderOfVersion: (tags at: index - 1)
							          of: working ] ].
	target location = installedFolder ifTrue: [ ^ self ].
	(self confirmInstalling: target) ifFalse: [ ^ self ].
	UIManager default
		informUser: 'Installing ' , (labels at: index) , '…'
		during: [ workspace switchTo: target ].
	self updateEntries.
	self selectEntryNamed: (index = 1
			 ifTrue: [ anEntry baseline ]
			 ifFalse: [ anEntry baseline , ' ' , (tags at: index - 1) ])
]

{ #category : 'actions' }
CMModelListPresenter >> chooseVersionOf: anEntry [
	"Let the modeler choose a version of the model of anEntry: among the catalog versions for an example, among the tags of its folder otherwise"

	anEntry folder isExample
		ifTrue: [ self chooseCatalogVersionOf: anEntry ]
		ifFalse: [ self chooseTagOf: anEntry ]
]

{ #category : 'actions' }
CMModelListPresenter >> confirmInstalling: aModelFolder [
	"Return whether to install the model of aModelFolder: at once when this Cormas checks it, otherwise when the user accepts the warning"

	| catalog |
	catalog := workspace catalog.
	(aModelFolder isCheckedBy: catalog) ifTrue: [ ^ true ].
	^ (UIManager default
		   confirm: (aModelFolder warningFrom: catalog)
		   trueChoice: 'Install anyway'
		   falseChoice: 'Cancel') = true
]

{ #category : 'initialization' }
CMModelListPresenter >> connectPresenters [

	table whenSelectedItemChangedDo: [ :entry | self show: entry ].
	self listenToWorkspace
]

{ #category : 'initialization' }
CMModelListPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  spacing: 5;
		  add: toolbar expand: false;
		  add: workspaceLabel expand: false;
		  add: (SpBoxLayout newLeftToRight
				   spacing: 10;
				   add: table width: 400;
				   add: (SpBoxLayout newTopToBottom
						    spacing: 5;
						    add: screenshot height: self class screenshotSize;
						    add: description;
						    add: actions height: 70;
						    yourself);
				   yourself);
		  yourself
]

{ #category : 'actions' }
CMModelListPresenter >> delete: anEntry [

	(UIManager default confirm:
		 'Delete the folder ' , anEntry folder location fullName
		 , '? It is backed up in Backups first' , (anEntry installedModel
			  ifNil: [ '.' ]
			  ifNotNil: [ ', and the model is uninstalled.' ])) ifTrue: [
		workspace delete: anEntry folder ]
]

{ #category : 'actions' }
CMModelListPresenter >> download: anEntry andInstall: aBoolean [

	| folder |
	UIManager default
		informUser: 'Downloading ' , anEntry name , '…'
		during: [ folder := workspace download: anEntry catalogModel ].
	(aBoolean and: [ self confirmInstalling: folder ]) ifTrue: [
			UIManager default
				informUser: 'Installing ' , anEntry name , '…'
				during: [ workspace install: folder ] ]
]

{ #category : 'actions' }
CMModelListPresenter >> export: anEntry [

	| zip |
	zip := UIManager default
		       chooseForSaveFileReference:
		       'Export ' , anEntry name , ' as a zip'
		       extensions: #( 'zip' )
		       path:
		       FileLocator home asFileReference / (anEntry name , '.zip').
	zip ifNotNil: [ workspace export: anEntry folder to: zip ]
]

{ #category : 'actions' }
CMModelListPresenter >> folderActionsFor: anEntry [

	| uninstall |
	uninstall := anEntry installedModel
		             ifNil: [ #(  ) ]
		             ifNotNil: [
		             { ('Uninstall…' -> [ self uninstall: anEntry ]) } ].
	anEntry folder ifNil: [
			^ (anEntry installedModel isNil or: [
				   anEntry otherFolders notEmpty ])
				  ifTrue: [ uninstall ]
				  ifFalse: [
						  { ('Restore folder' -> [ self restoreFolderOf: anEntry ]) }
						  , uninstall ] ].
	^ uninstall , (self renameActionsFor: anEntry) , (anEntry baseline
		   ifNil: [ #(  ) ]
		   ifNotNil: [ { ('Export…' -> [ self export: anEntry ]) } ]) , {
		  ('Delete…' -> [ self delete: anEntry ]).
		  ('Open folder' -> [ anEntry folder location openInOSFileBrowser ]) }
]

{ #category : 'initialization' }
CMModelListPresenter >> initializePresenters [

	self initializeToolbar.
	workspaceLabel := self newLabel.
	table := self newTable
		         addColumn:
			         (SpStringTableColumn
				          title: 'Model'
				          evaluated: [ :entry | entry name ]);
		         addColumn:
			         ((SpStringTableColumn
				           title: 'In'
				           evaluated: [ :entry | entry place ]) width: 80);
		         addColumn: ((SpStringTableColumn
				           title: 'State'
				           evaluated: [ :entry | entry state ]) width: 95);
		         yourself.
	screenshot := self newImage.
	description := self instantiate: MicrodownPresenter.
	actions := self newPresenter.
	self updateEntries
]

{ #category : 'initialization' }
CMModelListPresenter >> initializeToolbar [

	toolbar := self newToolbar.
	toolbar
		add: (self
				 toolbarButton: 'New'
				 icon: #smallNew
				 help: 'Create a new model in Models'
				 action: [ self newModel ]);
		add: (self
				 toolbarButton: 'From zip'
				 icon: #smallOpen
				 help: 'Install a model from a zip file'
				 action: [ self installFromZip ]);
		add: (self
				 toolbarButton: 'Reload'
				 icon: #refresh
				 help:
					 'Reload the installed models from their folders, for changes made outside Cormas'
				 action: [ self reloadFromFolders ]);
		add: (self
				 toolbarButton: 'Update catalog'
				 icon: #remote
				 help: 'Download the latest list of example models'
				 action: [ self updateCatalog ]);
		add: (self
				 toolbarButton: 'Update examples'
				 icon: #smallUpdate
				 help: 'Download the latest version of the downloaded examples'
				 action: [ self updateExamples ]);
		addItemRight: (self
				 toolbarButton: 'Workspace'
				 icon: #configuration
				 help: 'Change the working directory of this image'
				 action: [ self changeWorkspace ]);
		addItemRight: (self
				 toolbarButton: 'Open folder'
				 icon: #open
				 help: 'Open the workspace folder'
				 action: [ workspace location openInOSFileBrowser ])
]

{ #category : 'initialization' }
CMModelListPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		title: 'Cormas models';
		initialExtent: 1000 @ 750;
		whenClosedDo: [ workspace announcer unsubscribe: self ]
]

{ #category : 'actions' }
CMModelListPresenter >> install: anEntry [

	(self confirmInstalling: anEntry folder) ifFalse: [ ^ self ].
	UIManager default
		informUser: 'Installing ' , anEntry name , '…'
		during: [ workspace install: anEntry folder ]
]

{ #category : 'actions' }
CMModelListPresenter >> installFromZip [

	self run: [
			| zip folder |
			zip := UIManager default
				       chooseExistingFileReference: 'Install a model from a zip'
				       extensions: #( 'zip' )
				       path: FileLocator home asFileReference.
			zip ifNotNil: [
					folder := workspace addFromZip: zip.
					(self confirmInstalling: folder) ifTrue: [
							UIManager default
								informUser: 'Installing ' , zip basename , '…'
								during: [ workspace install: folder ] ].
					self updateEntries.
					self selectEntryNamed: (CMModelListEntry baselineOf: folder) ] ]
]

{ #category : 'updating' }
CMModelListPresenter >> isAnyFolderGone: anEntry [
	"Return whether the folder of anEntry, or the folder of an installed model that Cormas still saves, was deleted or moved outside Cormas. This only checks that a few folders exist, so it is cheap enough to do at every selection"

	(anEntry notNil and: [ anEntry isGone ]) ifTrue: [ ^ true ].
	^ workspace installedModels anySatisfy: [ :each |
		  each isSaved and: [ each folder exists not ] ]
]

{ #category : 'initialization' }
CMModelListPresenter >> listenToWorkspace [
	"Show the entries again whenever the workspace changes, whoever changed it: another window, a browser, a dialog or another tool. The update waits until the change is over. When another workspace replaces it, show that one"

	workspace announcer
		when: CMWorkspaceChanged
		do: [ UIManager default defer: [ self updateEntries ] ]
		for: self;
		when: CMWorkspaceReplaced
		do: [ :announcement | self showWorkspace: announcement workspace ]
		for: self
]

{ #category : 'actions' }
CMModelListPresenter >> mainActionsFor: anEntry [

	^ (self modelActionsFor: anEntry) , (anEntry hasVersions
		   ifTrue: [ { ('Versions…' -> [ self chooseVersionOf: anEntry ]) } ]
		   ifFalse: [ #(  ) ])
]

{ #category : 'actions' }
CMModelListPresenter >> modelActionsFor: anEntry [

	| state |
	state := anEntry state.
	state = 'Available' ifTrue: [
			^ {
				  ('Download and install'
				   -> [ self download: anEntry andInstall: true ]).
				  ('Download' -> [ self download: anEntry andInstall: false ]) } ].
	state = 'Not installed' ifTrue: [
		^ { ('Install' -> [ self install: anEntry ]) } ].
	(#( 'Installed' 'Not saved' ) includes: state) ifFalse: [ ^ #(  ) ].
	^ {
		  ('Simulate' -> [ self simulate: anEntry ]).
		  ('Sensitivity analysis' -> [ self analyseSensitivityOf: anEntry ]).
		  ('Browse' -> [ (self modelClassOf: anEntry) browse ]) }
	  , ((state = 'Not saved' and: [
			    anEntry folder notNil or: [ anEntry otherFolders notEmpty ] ])
			   ifTrue: [ { ('Reload from folder' -> [ workspace refresh ]) } ]
			   ifFalse: [ #(  ) ])
	  , (anEntry orphanPackageNames collect: [ :each |
			   'Add ' , each
			   -> [ anEntry installedModel addPackageNamed: each ] ]) asArray
]

{ #category : 'actions' }
CMModelListPresenter >> modelClassOf: anEntry [
	"Return the model class of the installed model, asking which one when it has several"

	| classes |
	classes := anEntry modelClasses.
	classes ifEmpty: [
		CMWorkspaceError signal: anEntry name , ' has no model class' ].
	classes size = 1 ifTrue: [ ^ classes first ].
	^ (UIManager default
		   chooseFrom: (classes collect: [ :each | each name ])
		   values: classes
		   title: 'Which model of ' , anEntry name , '?') ifNil: [
		  CMWorkspaceError signal: 'No model was chosen' ]
]

{ #category : 'actions' }
CMModelListPresenter >> newModel [

	(CMNewModelPresenter on: workspace)
		whenCreatedDo: [ :baselineName |
				self updateEntries.
				self selectEntryNamed: baselineName ];
		openModal
]

{ #category : 'actions' }
CMModelListPresenter >> reloadFromFolders [

	self run: [
			UIManager default
				informUser: 'Reloading the installed models from their folders…'
				during: [ workspace refresh ] ]
]

{ #category : 'actions' }
CMModelListPresenter >> rename: anEntry [
	| newName |
	newName := UIManager default
		           request: (String streamContents: [ :stream | stream 
							<< 'The name of a model is the name of its baseline, the class that loads it.'
							<< String cr << String cr
							<< 'Renaming '
							<< anEntry name
			           	<< ' renames BaselineOf'
							<< anEntry baseline
			           	<< ' and its package,'
							<< String cr
							<< 'cormas.json, and the folder when it has the name of the model.'
							<< String cr << String cr
							<< 'The other packages and classes keep their names.' ])
		           initialAnswer: anEntry baseline
		           title: 'Rename the model ' , anEntry name.
	(newName isNil or: [ newName = anEntry baseline ]) ifTrue: [ ^ self ].
	workspace rename: anEntry baseline to: newName
]

{ #category : 'actions' }
CMModelListPresenter >> renameActionsFor: anEntry [
	"Only a model of Models that is installed and saved can be renamed: examples and old versions cannot be changed"

	^ (anEntry state = 'Installed' and: [
		   anEntry folder isExample not and: [ anEntry folder isOldVersion not ] ])
		  ifTrue: [ { ('Rename…' -> [ self rename: anEntry ]) } ]
		  ifFalse: [ #(  ) ]
]

{ #category : 'actions' }
CMModelListPresenter >> restoreFolderOf: anEntry [
	"Write the code of a model whose folder is gone into a new folder of Models, and show it"

	UIManager default
		informUser: 'Restoring ' , anEntry name , '…'
		during: [ workspace restoreFolderOf: anEntry installedModel ].
	self updateEntries.
	self selectEntryNamed: anEntry name
]

{ #category : 'updating' }
CMModelListPresenter >> rowOfButtons: labelsAndActions [

	| row |
	row := SpBoxLayout newLeftToRight
		       spacing: 5;
		       yourself.
	labelsAndActions do: [ :each |
			row
				add: (self newButton
						 label: each key;
						 action: [ self run: each value ];
						 yourself)
				expand: false ].
	^ row
]

{ #category : 'actions' }
CMModelListPresenter >> run: aBlock [
	"Run an action, explain why Cormas refused it, and show what it changed"

	[ aBlock value ]
		on: CMWorkspaceError
		do: [ :error | UIManager default alert: error messageText ].
	self updateEntries
]

{ #category : 'updating' }
CMModelListPresenter >> screenshotOf: anEntry [
	"Return the screenshot scaled to fit, or nil when there is none or it cannot be read"

	| form |
	form := anEntry screenshotFile ifNil: [ ^ nil ].
	^ [
		  (form binaryReadStreamDo: [ :stream |
			   ImageReadWriter formFromStream: stream ]) scaledToSize:
			  self class screenshotSize @ self class screenshotSize ]
		  on: Error
		  do: [ nil ]
]

{ #category : 'updating' }
CMModelListPresenter >> selectEntryNamed: aName [

	table items
		detect: [ :each | each name = aName ]
		ifFound: [ :entry |
				table selectItem: entry.
				self show: entry ]
		ifNone: [ self show: nil ]
]

{ #category : 'initialization' }
CMModelListPresenter >> setModelBeforeInitialization: aWorkspace [

	workspace := aWorkspace
]

{ #category : 'updating' }
CMModelListPresenter >> show: anEntry [
	"Show the entry, or nothing. When a folder was deleted or moved outside Cormas since the entries were read, refresh the workspace and list the folders again instead, as when the window opens"

	(self isAnyFolderGone: anEntry) ifTrue: [
		^ self run: [ workspace refresh ] ].
	anEntry ifNil: [
			screenshot image: nil.
			description documentFromString: ''.
			actions layout: SpBoxLayout newTopToBottom.
			^ self ].
	screenshot image: (self screenshotOf: anEntry).
	description documentFromString: anEntry description.
	actions layout: (self actionsLayoutFor: anEntry)
]

{ #category : 'initialization' }
CMModelListPresenter >> showWorkspace: aWorkspace [
	"Show aWorkspace instead of the one I showed"

	workspace announcer unsubscribe: self.
	workspace := aWorkspace.
	self listenToWorkspace.
	self updateEntries
]

{ #category : 'actions' }
CMModelListPresenter >> simulate: anEntry [

	CMSimulationApplication new
		cormasModel: (self modelClassOf: anEntry) new;
		run
]

{ #category : 'initialization' }
CMModelListPresenter >> toolbarButton: aLabel icon: anIconName help: aHelp action: aBlock [

	^ self newToolbarButton
		  label: aLabel;
		  icon: (self iconNamed: anIconName);
		  help: aHelp;
		  action: aBlock;
		  yourself
]

{ #category : 'actions' }
CMModelListPresenter >> uninstall: anEntry [

	(UIManager default confirm: 'Uninstall ' , anEntry name
		 ,
		 '? Its code is removed from this image, after being backed up in Backups. Its folder stays as it is.')
		ifTrue: [ workspace uninstall: anEntry baseline ]
]

{ #category : 'actions' }
CMModelListPresenter >> updateCatalog [

	self run: [
			UIManager default
				informUser: 'Downloading the catalog of example models…'
				during: [ workspace updateCatalog ] ]
]

{ #category : 'updating' }
CMModelListPresenter >> updateEntries [
	"Show the folders and catalog models of the workspace again, keeping the selected model selected"

	| selectedName |
	selectedName := table selectedItem ifNotNil: [ :entry | entry name ].
	workspaceLabel label: 'Workspace: ' , workspace location fullName.
	table items: (CMModelListEntry entriesOf: workspace) asArray.
	self selectEntryNamed: selectedName
]

{ #category : 'actions' }
CMModelListPresenter >> updateExamples [

	self run: [
			UIManager default
				informUser: 'Downloading the latest version of the examples…'
				during: [ workspace updateExamples ] ]
]
