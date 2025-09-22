Class {
	#name : 'CMNewTilesetPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'descriptionLabel',
		'uploadImagesButton',
		'imagesTable',
		'images',
		'imagePreviews',
		'classNameInput',
		'packageNameInput',
		'selectPackageButton',
		'statusLabel',
		'acceptButton',
		'cancelButton',
		'targetPackage',
		'targetClass'
	],
	#category : 'Cormas-UI-Tilesets-Presenters',
	#package : 'Cormas-UI-Tilesets',
	#tag : 'Presenters'
}

{ #category : 'constants' }
CMNewTilesetPresenter class >> acceptedImageFormats [

	^ #(PNG JPG JPEG)
]

{ #category : 'examples' }
CMNewTilesetPresenter class >> exampleEmpty [

	self new open
]

{ #category : 'examples' }
CMNewTilesetPresenter class >> exampleForClass [

	(self new
		targetClass: CMTileset;
		yourself) open
]

{ #category : 'examples' }
CMNewTilesetPresenter class >> exampleForPackage [

	(self new
		targetPackage: 'Cormas-UI-Tilesets' asPackage;
		yourself) open
]

{ #category : 'accessing' }
CMNewTilesetPresenter >> conditionsText [

	^ String streamContents: [ :stream |
		stream
			<< '•   Supported file formats: '
			<< (', ' join: self class acceptedImageFormats)
			<< String cr
			<< '•   Recommended size: at least '
			<< CMTile largeExtent x asString << 'x' << CMTile largeExtent y asString
			<< ' pixels'
			<< String cr
			<< '•   All images must be square' ]
]

{ #category : 'initialization' }
CMNewTilesetPresenter >> connectPresenters [

	uploadImagesButton action: [ self onUploadImagesClicked ].
	acceptButton action: [ self onGenerateClicked ].
	selectPackageButton action: [ self onSelectPackageClicked ].
	cancelButton action: [ self window close ].
]

{ #category : 'layout' }
CMNewTilesetPresenter >> defaultLayout [

	| conditions |

	conditions := SpBoxLayout newVertical.
	
	self conditionsText lines do: [ :line |
		conditions add: line expand: false ].
	
	^ SpBoxLayout newTopToBottom
		borderWidth: 2;
		spacing: 5;
		add: descriptionLabel expand: false;
		add: (SpBoxLayout newLeftToRight
			add: '' width: 30;
			add: conditions;
			yourself) expand: false;
		add: uploadImagesButton height: 40;
		add: imagesTable;
		add: (SpBoxLayout newTopToBottom
			spacing: 2;
			add: (SpBoxLayout newLeftToRight
				add: 'Package' width: 80;
				add: packageNameInput;
				add: selectPackageButton width: 40;
				yourself) expand: false;
			add: (SpBoxLayout newLeftToRight
				add: 'Class name' width: 80;
				add: classNameInput;
				yourself) expand: false;
			yourself) expand: false;
		add: statusLabel expand: false;
		add: (SpBoxLayout newLeftToRight
			add: '';
			add: cancelButton expand: false;
			add: acceptButton expand: false;
			yourself) expand: false;
		yourself
]

{ #category : 'accessing' }
CMNewTilesetPresenter >> descriptionText [

	^ 'Select images to upload'
]

{ #category : 'examples' }
CMNewTilesetPresenter >> example [
	<script: 'self exampleForPackage'>
]

{ #category : 'as yet unclassified' }
CMNewTilesetPresenter >> fileNameToCamelCase: aString [

	| name |
	name := aString.

	'-_' do: [ :specialCharacter |
		name := name copyReplaceAll: specialCharacter asString with: ' ' ].
	
	^ name asCamelCase uncapitalized 
]

{ #category : 'code generation' }
CMNewTilesetPresenter >> generateContentsMethodInTargetClassForImage: aForm named: aString [

	| sourceCode method |
	
	sourceCode := String streamContents: [ :stream |
		stream
			<< aString
			<< 'Contents'
			<< String cr
			<< '	"Generated method with the content of the image"'
			<< String cr
			<< '	^ '''
			<< (self imageToBase64: aForm)
			<< '''' ].
	
	method := targetClass compiler compile: sourceCode.

	targetClass class
		addSelector: (aString, 'Contents') asSymbol
		withMethod: method.
]

{ #category : 'code generation' }
CMNewTilesetPresenter >> generateMethodInTargetClassForImageNamed: aString [

	| sourceCode method |
	
	sourceCode := String streamContents: [ :stream |
		stream
			<< aString
			<< String cr
			<< '	"Generated method"'
			<< String cr
			<< '	<script: ''self ' << aString << ' inspect''>'
			<< String cr
			<< '	<tile>'
			<< String cr
			<< '	^ self tiles'
			<< String cr
			<< '		at: #' << aString
			<< String cr
			<< '		ifAbsentPut: [ CMTile newFrom: self ' << aString << 'Contents ]' ].
	
	method := targetClass compiler compile: sourceCode.

	targetClass class 
		addSelector: aString asSymbol
		withMethod: method.
]

{ #category : 'code generation' }
CMNewTilesetPresenter >> generateMethodsInTargetClass [
	
	| scaledImage |
	
	images keysAndValuesDo: [ :name :image |
		scaledImage := image scaledToSize: CMTile largeExtent.
		
		self generateContentsMethodInTargetClassForImage: scaledImage named: name.
		self generateMethodInTargetClassForImageNamed: name ]
]

{ #category : 'code generation' }
CMNewTilesetPresenter >> generateTargetClass [

	| targetClassName |
	
	targetClassName := classNameInput text.
	
	targetClass := (Object << targetClassName asSymbol
		traits: { TCMTileset };
		package: targetPackage name) install.
]

{ #category : 'as yet unclassified' }
CMNewTilesetPresenter >> imageToBase64: aForm [
	"TODO: I don't know a way to convert a Form to base64 without saving it to a file and reading it back. If we find a way, we should optimize this method"
	
	| dummyFile |
	dummyFile := FileSystem memory / 'dummy.png'.
	PNGReadWriter putForm: aForm onStream: dummyFile binaryWriteStream.

	^ (dummyFile binaryReadStreamDo: #contents) base64Encoded
]

{ #category : 'initialization' }
CMNewTilesetPresenter >> initializePresenters [

	images := Dictionary new.
	
	"Small images that will be displayed in the table. We store them in Dictionary to render faster (otherwise it will read large files and reduce them to small images every time you scroll)"
	imagePreviews := Dictionary new.

	descriptionLabel := self newLabel
		label: self descriptionText;
		yourself.
		
	uploadImagesButton := self newButton
		label: 'Upload images';
		icon: (self iconNamed: #open);
		yourself.
		
	imagesTable := self newTable
		hideColumnHeaders;
		yourself.
		
	self initializeTableColumns.
	self initializeTableMenu.
	
	classNameInput := self newTextInput.
	packageNameInput := self newTextInput.
	
	selectPackageButton := self newButton
		icon: (self iconNamed: #package);
		yourself.
		
	statusLabel := self newLabel.
		
	acceptButton := self newButton
		label: 'Generate';
		icon: (self iconNamed: #accept);
		yourself.
		
	cancelButton := self newButton
		label: 'Cancel';
		icon: (self iconNamed: #cancel);
		yourself
]

{ #category : 'initialization' }
CMNewTilesetPresenter >> initializeTableColumns [

	imagesTable addColumn: ((SpImageTableColumn
		evaluated: [ :name | imagePreviews at: name ])
		beNotExpandable;
		yourself).
	
	imagesTable addColumn: ((SpStringTableColumn
		evaluated: [ :name | name ])
		width: 200;
		yourself).
		
	imagesTable addColumn: ((SpStringTableColumn
		evaluated: [ :name | (self isSquareImage: (images at: name))
			ifTrue: [ '[valid]' ]
			ifFalse: [ '[invalid] not a square image' ] ])
		displayColor: [ :name | (self isSquareImage: (images at: name))
			ifTrue: [ Color green ]
			ifFalse: [ Color red ] ];
		width: 150;
		yourself)
]

{ #category : 'initialization' }
CMNewTilesetPresenter >> initializeTableMenu [

	imagesTable contextMenu: (SpMenuPresenter new 
		addItem: [ :item | item 
			name: 'Preview'; 
			icon: (self iconNamed: #glamorousSearch);
			action: [ (images at: imagesTable selectedItem) inspect ] ];
		addItem: [ :item | item
			name: 'Remove';
			icon: (self iconNamed: #remove);
			action: [ self removeImageNamed: imagesTable selectedItem ] ]
		yourself).
]

{ #category : 'initialization' }
CMNewTilesetPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	
	aWindowPresenter 
		title: 'New Tileset';
		initialExtent: 400@600
]

{ #category : 'testing' }
CMNewTilesetPresenter >> isSquareImage: aForm [

	^ aForm extent x = aForm extent y
]

{ #category : 'callbacks' }
CMNewTilesetPresenter >> onGenerateClicked [

	targetClass ifNil: [ self generateTargetClass ].
	self generateMethodsInTargetClass.
	
	self window close
]

{ #category : 'callbacks' }
CMNewTilesetPresenter >> onSelectPackageClicked [

	SpSelectDialog new
		title: 'Select a package';
		label: 'Select a package for your new tileset';
		items: Smalltalk packages sorted;
		display: [ :each | each name ];
		displayIcon: [ :each | self iconNamed: #package ];
		onAccept: [ :dialog |
			self targetPackage: dialog presenter selectedItem ];
		openDialog
]

{ #category : 'callbacks' }
CMNewTilesetPresenter >> onUploadImagesClicked [

	| presenter |
	
	presenter := StOpenFilePresenter new
		beMultipleSelection;
		filter: (StCustomExtensionsFilter extensions: #( '.png' '.jpg' ));
		defaultFolder: FileLocator home asFileReference;
		yourself.
		
	presenter okAction: [ :selectedFileReference | self showSelectedImages: presenter selectedEntries ].
	presenter open
]

{ #category : 'removing' }
CMNewTilesetPresenter >> removeImageNamed: aString [

	images removeKey: aString.
	imagePreviews removeKey: aString.
	imagesTable items: (imagesTable items copyWithout: aString)
]

{ #category : 'as yet unclassified' }
CMNewTilesetPresenter >> showSelectedImages: aCollectinOfFileReferences [

	| name |

	images removeAll.
	imagePreviews removeAll.
	
	aCollectinOfFileReferences
		do: [ :fileReference |
			name := self fileNameToCamelCase:
				(fileReference basename copyUpToLast: Path extensionDelimiter).
			
			images at: name put:
				(fileReference binaryReadStreamDo: [ :stream |
					ImageReadWriter formFromStream: stream ]) ]
		displayingProgress: [ :fileReference | 'Uploading ', fileReference basename ].
		
	images keysAndValuesDo: [ :key :value |
		imagePreviews at: key put: (value scaledToSize: 20@20) ].

	imagesTable items: images keys sorted
]

{ #category : 'accessing' }
CMNewTilesetPresenter >> targetClass: aClass [

	targetClass := aClass.
	
	self targetPackage: aClass package.
	classNameInput text: aClass name
]

{ #category : 'accessing' }
CMNewTilesetPresenter >> targetPackage: aPackage [

	targetPackage := aPackage.
	packageNameInput text: targetPackage name
]
