"
Provides utilities to browse and open a model file (.st).

A CORMAS project file is created automatically for the opened model.

"
Class {
	#name : #CMModelOpener,
	#superclass : #CMResourceOpener,
	#category : #'Cormas-UI-Project'
}

{ #category : #accessing }
CMModelOpener >> cormasOpenLocations [
	" Answer a <Collection> of <String> with valid locations for opening a Cormas model "
	
	^ self cormasOpenLocationsMap keys

]

{ #category : #accessing }
CMModelOpener >> cormasOpenLocationsMap [
	" Answer a <Dictionary> of valid locations for opening a Cormas model "

	^ Dictionary new
		at: self translator tLocalStorage 		put: #requestOpenFromLocalDisk;
		at: 'URL' 										put: #requestModelOpenFromURL;
		at: self translator tLocalImage			put: #requestOpenFromLocalImage;
		at: self translator tRemoteImage 			put: #requestModelOpenFromRemoteImage;
		yourself 
]

{ #category : #callbacks }
CMModelOpener >> open: modelName fileName: fileName [
	" Open the model named modelName "

	| modelClass |
	modelClass := self class environment at: (self projectManager findModelClass: fileName) allButFirst asSymbol.
	self currentProject:
		(CMProjectModel basicNew
			fileName: fileName;
			initializeForModel: modelClass new named: modelName;
			yourself)

]

{ #category : #callbacks }
CMModelOpener >> openModel: modelName [
	" Open the project of the modelClass "

	^ self currentProject: (CMProjectModel basicNew
		projectManager: self projectManager;
		initializeForModel: (self class environment at: modelName) new
			named: modelName;
			yourself)
]

{ #category : #callbacks }
CMModelOpener >> openProject [
	" Request a model to the user and open it for the receiver "

	self requestNameLocation ifNotNil: [ : locName | 
		self perform: (self cormasOpenLocationsMap at: locName) ].

]

{ #category : #callbacks }
CMModelOpener >> requestNameLocation [
	" Open request dialog to select a load model location "
	
	| listPresenter |
	
	listPresenter := SpListPresenter new
		items: self cormasOpenLocations;
		yourself.
	
	"Open modal dialog and wait for user response"	
	listPresenter asModalWindow 
		title: self translator tWhichOpeningLocation;
		open.
		
	^ listPresenter selectedItem		
		
]

{ #category : #callbacks }
CMModelOpener >> requestOpenDialogFromLocalDisk [
	" Open a Cormas model. Answer project creation status, <true> if project was opened successfully "
	
	| listPresenter |
	
	listPresenter := SpListPresenter new
		items: self projectManager cormasModels;
		yourself.
	
	"Open modal dialog and wait for user response"	
	listPresenter asModalWindow 
		title: self translator tWhichModel;
		open.
		
	^ listPresenter selectedItem	
]

{ #category : #callbacks }
CMModelOpener >> requestOpenDialogFromLocalImage [
	" Open a Cormas model. Answer a <String> with the project name it it was opened successfully, nil otherwise "
	
	| listPresenter |
	
	listPresenter := SpListPresenter new
		items: CMAbstractModel subclasses;
		yourself.
	
	"Open modal dialog and wait for user response"	
	listPresenter asModalWindow 
		title: self translator tWhichModel;
		open.
		
	^ listPresenter selectedItem ifNotNil: [ :selection | selection name ].
]

{ #category : #callbacks }
CMModelOpener >> requestOpenFromLocalDisk [
	" Open a Cormas model. Answer project creation status, <true> if project was opened successfully "

	| mName fileName |
	(mName := self requestOpenDialogFromLocalDisk)
		ifNotNil: [ :modelName | fileName := self requestOpenNamed: modelName ].
	openStatus
		ifTrue: [ self open: mName fileName: fileName.
			self projectManager doPostOpenActions ]
		ifFalse: [ self informMessage: self translator tProjectOpenFailed ].
	^ openStatus
]

{ #category : #callbacks }
CMModelOpener >> requestOpenFromLocalImage [
	" Open a Cormas model. Answer project creation status, <true> if project was opened successfully "

	| mName |
	
	openStatus := false.
	(mName := self requestOpenDialogFromLocalImage) ifNotNil: [ :modelName | openStatus := true ].
	openStatus
		ifTrue: [ 
			self openModel: mName.
			self projectManager doPostOpenActions ]
		ifFalse: [ self informMessage: self translator tProjectOpenFailed ].
	^ openStatus
]

{ #category : #callbacks }
CMModelOpener >> requestOpenNamed: aString [
	" Request a file to be opened as CORMAS project "

	(FDOpenFileDialog new
		title: self translator tChooseStFile;
		extensionFilters: 	{ self translator tStFiles -> #(st) };
		defaultFolder: self gitBridge modelsPath;
		openModal)	
			
		ifNotNil: [ : fileRef | 
			self tryOpenFromFile: fileRef.
			openStatus := true.
			^ fileRef fullName ]
		ifNil: [ openStatus := false ]
]
