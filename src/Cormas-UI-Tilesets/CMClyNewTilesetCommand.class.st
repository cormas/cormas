Class {
	#name : 'CMClyNewTilesetCommand',
	#superclass : 'CMClyPackageCommand',
	#category : 'Cormas-UI-Tilesets',
	#package : 'Cormas-UI-Tilesets'
}

{ #category : 'activation' }
CMClyNewTilesetCommand class >> fullBrowserMenuActivation [
	<classAnnotation>
	
	^ CmdContextMenuActivation
		byItemOf: CMClyMenuGroup
		for: ClyFullBrowserPackageContext
]

{ #category : 'accessing' }
CMClyNewTilesetCommand >> defaultMenuIconName [

	^ #smallNew
]

{ #category : 'accessing' }
CMClyNewTilesetCommand >> defaultMenuItemName [
	^'New Cormas tileset'
]

{ #category : 'accessing' }
CMClyNewTilesetCommand >> description [

	^ 'Create a new Cormas tileset'
]

{ #category : 'execution' }
CMClyNewTilesetCommand >> execute [

	CMNewTilesetPresenter new
		targetPackage: package;
		open
]
