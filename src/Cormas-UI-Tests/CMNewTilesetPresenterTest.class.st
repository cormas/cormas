"
I check that the tilesets generated from images keep working, also after they are saved and loaded again.

## Responsibility:

- Generate a tile into a temporary tileset in a temporary package.
- Check that the tile can be read right after it is generated, and after a save and reload.
- Check that the default tileset answers its tiles.

## Collaborators: 

- `CMNewTilesetPresenter`: generates the tiles.
- `CMTileset`: the superclass of the temporary tileset.

### Implementation Points

A snapshot of the temporary package stands for saving it to git, and installing the snapshot stands for loading it.
"
Class {
	#name : 'CMNewTilesetPresenterTest',
	#superclass : 'TestCase',
	#instVars : [
		'tileset'
	],
	#category : 'Cormas-UI-Tests',
	#package : 'Cormas-UI-Tests'
}

{ #category : 'running' }
CMNewTilesetPresenterTest >> setUp [

	| presenter |
	super setUp.
	self class packageOrganizer ensurePackage: self temporaryPackageName.
	tileset := (CMTileset << #CMGeneratedTestTileset package:
		            self temporaryPackageName) install.
	presenter := CMNewTilesetPresenter new.
	presenter targetClass: tileset.
	presenter
		generateContentsMethodInTargetClassForImage:
			((Form extent: CMTile largeExtent depth: 32)
				 fillColor: Color red;
				 yourself)
		named: 'tree'.
	presenter generateMethodInTargetClassForImageNamed: 'tree'
]

{ #category : 'running' }
CMNewTilesetPresenterTest >> tearDown [

	(self class environment at: #CMGeneratedTestTileset ifAbsent: [ nil ])
		ifNotNil: [ :class | class removeFromSystem ].
	(self class packageOrganizer
		 packageNamed: self temporaryPackageName
		 ifAbsent: [ nil ]) ifNotNil: [ :package | package removeFromSystem ].
	super tearDown
]

{ #category : 'private' }
CMNewTilesetPresenterTest >> temporaryPackageName [

	^ 'Cormas-UI-Tests-GeneratedTileset'
]

{ #category : 'tests' }
CMNewTilesetPresenterTest >> testDefaultTilesetAnswersItsTiles [

	self assert: (CMDefaultTileset grass isKindOf: CMTile).
	self assert: (CMDefaultTileset tileSelectors includes: #grass)
]

{ #category : 'tests' }
CMNewTilesetPresenterTest >> testGeneratedTileIsAnsweredAfterSavingAndLoading [

	| snapshot |
	snapshot := (MCPackage named: self temporaryPackageName) snapshot.
	tileset removeFromSystem.

	snapshot install.

	tileset := self class environment at: #CMGeneratedTestTileset.
	self assert: (tileset tree isKindOf: CMTile)
]

{ #category : 'tests' }
CMNewTilesetPresenterTest >> testGeneratedTileIsAnsweredByTheTileset [

	self assert: (tileset tree isKindOf: CMTile).
	self assert: (tileset tileSelectors includes: #tree)
]
